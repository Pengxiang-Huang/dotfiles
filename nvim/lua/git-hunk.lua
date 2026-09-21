-- jump between git changed lines in the current buffer
local M = {}

-- what the buffer is compared against: ":" is the index (like plain `git diff`),
-- set to "HEAD" to also count changes that are already staged
M.base = ":"

local function git(dir, args)
  local cmd = { "git", "-C", dir }
  vim.list_extend(cmd, args)
  local out = vim.fn.systemlist(cmd)
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return out
end

-- the file as it looks in M.base, nil when the file is not tracked there
local function base_lines(file)
  local dir = vim.fn.fnamemodify(file, ":h")
  if not git(dir, { "rev-parse", "--show-toplevel" }) then
    return nil, "not a git repository"
  end
  local rel = git(dir, { "ls-files", "--full-name", "--error-unmatch", "--", file })
  if not rel or not rel[1] then
    return nil, "not tracked by git"
  end
  local rev = M.base == ":" and (":" .. rel[1]) or (M.base .. ":" .. rel[1])
  return git(dir, { "show", rev })
end

-- first line of every changed block, in buffer line numbers
local function hunks()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" or vim.bo.buftype ~= "" then
    return nil, "not a file buffer"
  end

  local old, err = base_lines(file)
  if not old then
    return nil, err or "no version to compare against"
  end

  local new = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local diff = vim.diff(
    table.concat(old, "\n") .. "\n",
    table.concat(new, "\n") .. "\n",
    { result_type = "indices", algorithm = "histogram" }
  )

  local starts = {}
  for _, h in ipairs(diff) do
    local start, count = h[3], h[4]
    -- a pure deletion reports count 0 and the line above it, so land on the
    -- line that closed the gap instead of on line 0
    table.insert(starts, count == 0 and math.max(start, 1) or start)
  end
  return starts
end

local function jump(direction)
  local starts, err = hunks()
  if not starts then
    vim.notify("git hunks: " .. err, vim.log.levels.WARN)
    return
  end
  if #starts == 0 then
    vim.notify("git hunks: no changes", vim.log.levels.INFO)
    return
  end

  local cur = vim.api.nvim_win_get_cursor(0)[1]
  local target, index
  if direction > 0 then
    for i, line in ipairs(starts) do
      if line > cur then
        target, index = line, i
        break
      end
    end
    if not target then
      target, index = starts[1], 1 -- wrap around
    end
  else
    for i = #starts, 1, -1 do
      if starts[i] < cur then
        target, index = starts[i], i
        break
      end
    end
    if not target then
      target, index = starts[#starts], #starts
    end
  end

  vim.cmd("normal! m'") -- keep <C-o> working
  vim.api.nvim_win_set_cursor(0, { target, 0 })
  vim.cmd("normal! zz")
  vim.notify(string.format("git hunk %d/%d", index, #starts), vim.log.levels.INFO)
end

function M.next()
  jump(1)
end

function M.prev()
  jump(-1)
end

-- all changed lines of the buffer in the quickfix list
function M.list()
  local starts, err = hunks()
  if not starts then
    vim.notify("git hunks: " .. err, vim.log.levels.WARN)
    return
  end
  local items = {}
  for _, line in ipairs(starts) do
    table.insert(items, { bufnr = vim.api.nvim_get_current_buf(), lnum = line, text = "git hunk" })
  end
  vim.fn.setqflist(items, " ")
  if #items > 0 then
    vim.cmd("copen")
  else
    vim.cmd("cclose")
    vim.notify("git hunks: no changes", vim.log.levels.INFO)
  end
end

return M

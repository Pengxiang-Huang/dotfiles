local ok, ts = pcall(require, "nvim-treesitter")
if not ok then
  vim.notify("nvim-treesitter not available on runtimepath", vim.log.levels.WARN)
  return
end

-- install the parsers
ts.install({ "c", "cpp", "cmake", "rust", "vim", "lua", "llvm" })

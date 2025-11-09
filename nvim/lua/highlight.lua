local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("not found nvim-treesitter")
    return
end

treesitter.setup({
  -- install language parser
  ensure_installed = { "c", "cpp", "rust", "vim", "lua", "llvm"}, 
  
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})


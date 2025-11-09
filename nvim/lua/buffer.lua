local status, bufferline = pcall(require, "bufferline")
if not status then
    vim.notify("not found bufferline")
  return
end

-- bufferline, currently has bug in this plugin
bufferline.setup({
  options = {
   -- numbers = function(opts)
   --    return tostring(opts.ordinal)
   --  end,    
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
   
		numbers = "ordinal",

    offsets = {
      {
        filetype = "Neotree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})




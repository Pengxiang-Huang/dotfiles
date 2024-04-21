local status, wk = pcall(require, "which-key")

if not status then
		vim.notify("not found which-key")
	return
end

wk.setup{}

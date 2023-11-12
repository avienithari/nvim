local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
	print("Colorscheme not found! Using backup one.")
	pcall(vim.cmd, "colorscheme tokyonight-storm")
	return
end

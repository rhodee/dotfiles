local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

nvim_tree.setup({})

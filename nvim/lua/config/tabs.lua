local M = {}

function M.config(opts)
	vim.opt.tabstop = opts.width
	vim.opt.softtabstop = opts.width
	vim.opt.shiftwidth = opts.width
	vim.opt.expandtab = true
end

return M

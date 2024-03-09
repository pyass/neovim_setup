vim.g.mapleader = ","
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.errorbells = false
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.errorbells = false
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.incsearch = true
vim.o.encoding = "utf-8"
vim.o.undodir = vim.fn.stdpath("config") .. "/undo"
vim.o.undofile = true
vim.o.compatible = false
vim.o.backspace = "indent,eol,start"
vim.o.nrformats = "hex,alpha"
vim.o.termguicolors = true

-- newest stuff from kickstart
vim.o.ignorecase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
-- vim.o.timeoutlen = 300
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.hlsearch = true

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("the-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
--

local theme, _ = pcall(require, "tokyonight")
if not theme then
	return
end
vim.cmd("colorscheme tokyonight")

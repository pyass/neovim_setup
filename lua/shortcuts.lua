vim.api.nvim_set_keymap("i","jk","<ESC>",{ noremap = true })

vim.api.nvim_set_keymap("n","<leader>w","<C-W>w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>q",":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>C",":q!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>s",":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>z",":qa<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>nt",":tabnew<SPACE>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>vi",":source<Space>$MYVIMRC<CR>", { noremap = true })


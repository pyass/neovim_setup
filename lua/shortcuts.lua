vim.api.nvim_set_keymap("i","jk","<ESC>",{ noremap = true })

vim.api.nvim_set_keymap("n","<leader>w","<C-W>w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>q",":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>Q",":q!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>s",":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>z",":qa<CR>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>nt",":tabnew<SPACE>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>vi",":source<Space>$MYVIMRC<CR>", { noremap = true })

vim.api.nvim_set_keymap("n","<C-p>","<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>ff","<cmd>lua require('telescope.builtin').git_files()<cr>", { noremap = true })


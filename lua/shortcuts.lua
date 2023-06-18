vim.api.nvim_set_keymap("i","jk","<ESC>",{ noremap = true })

vim.keymap.set("n","<leader>w","<C-W>w<CR>", { noremap = true })
vim.keymap.set("n","<leader>q",":q<CR>", { noremap = true })
vim.keymap.set("n","<leader>C",":q!<CR>", { noremap = true })
vim.keymap.set("n","<leader>s",":w<CR>", { noremap = true })
vim.keymap.set("n","<leader>z",":qa<CR>", { noremap = true })
vim.keymap.set("n","<leader>nt",":tabnew<SPACE>", { noremap = true })
vim.keymap.set("n","<leader>vi",":source<Space>$MYVIMRC<CR>", { noremap = true })
vim.keymap.set("n","<leader>gi",":Git<CR>", { noremap = true })
vim.keymap.set("n","<leader>gp",":Git -c push.default=current push<CR>", { noremap = true })
vim.keymap.set("n","<leader>bl",":!black %<CR>", { noremap = true })

vim.keymap.set("n","<leader>cd",":lua vim.o.autochdir=true<CR>", { noremap = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-i>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>nn", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>np", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

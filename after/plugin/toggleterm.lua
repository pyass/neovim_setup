local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
    return
end

toggleterm.setup({
    size = 20,
    open_mapping = [[<c-_>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

-- vim.keymap.set("n","<leader>tg","<cmd>ToggleTerm<cr>", { noremap = true })

vim.keymap.set("n", "<C-s>", "<cmd>ToggleTerm<cr>", { noremap = true })

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, 't', '<C-s>', "<cmd>ToggleTerm<cr>", opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require('toggleterm.terminal').Terminal

local npm = Terminal:new({ cmd = "npm run build"})

local rust = Terminal:new({ cmd = "cargo run"})

local cargo_test = Terminal:new({ cmd = "cargo test"})

function NPM_build_toggle()
    npm:toggle()
end

function Cargo_build_toggle()
    rust:toggle()
end

function Cargo_test_toggle()
    cargo_test:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>npm", "<cmd> lua NPM_build_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>rs", "<cmd> lua Cargo_build_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>rts", "<cmd> lua Cargo_build_toggle()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>py", "<cmd> TermExec cmd='python3 %'<CR>", { noremap = true, silent = true })

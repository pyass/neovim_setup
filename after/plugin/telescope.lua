local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

telescope.setup {
    extensions = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            dir_icon = "📁",
            grouped = true
        }
    },
    defaults = {
        mappings = {
            n = {
                ['<leader>q'] = require("telescope.actions").close
            },
            i = {
                ['<C-t>'] = require("telescope.actions").select_tab
            }
        },
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        generic_sorter = require("telescope.sorters").get_fzy_sorter,
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden"
        },
        file_ignore_patterns = {
            "node_modules",
            ".git/.*",
            "dist/.*",
            "__pycache__",
            "target",
            "undo",
            "vendor",
            "env"
        }
    }
}

telescope.load_extension "file_browser"

vim.keymap.set("n", "<C-j>", "<cmd>Telescope file_browser<cr>", { noremap = true })
vim.api.nvim_set_keymap(
    "n",
    "<leader>fcd",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
)
vim.keymap.set("n", "<C-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>bu", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').git_files()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>fw", "<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>",
    { noremap = true })
vim.keymap.set("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ma", "<cmd>Mason<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ht", "<cmd>Telescope help_tags<cr>", { noremap = true })

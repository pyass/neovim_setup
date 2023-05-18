local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
    extension = {
        file_browser = {
            theme = "ivy",
            hijack_netrw = true
        }
    },
    defaults = {
        mappings = {
            n = {
                ['<leader>q'] = require("telescope.actions").close
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
            "target"
        }
    }
}

telescope.load_extension "file_browser"

vim.keymap.set("n","<C-p>","<cmd>Telescope file_browser<cr>", { noremap = true })
vim.keymap.set("n","ff","<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.keymap.set("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.keymap.set("n","<leader>fg","<cmd>lua require('telescope.builtin').git_files()<cr>", { noremap = true })
vim.keymap.set("n","<leader>fs","<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>", { noremap = true })
vim.keymap.set("n","<leader>fw","<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols()<cr>", { noremap = true })
vim.keymap.set("n","<leader>lg","<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.keymap.set("n","<leader>kt","<cmd>Telescope keymaps<cr>", { noremap = true })
vim.keymap.set("n","<leader>om","<cmd>Mason<cr>", { noremap = true })
vim.keymap.set("n", "<leader>ht", "<cmd>Telescope help_tags<cr>",{ noremap = true })


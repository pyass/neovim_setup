local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
    defaults = {
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
            "__pycache__"
        }
    }
}

vim.api.nvim_set_keymap("n","<C-p>","<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true })
vim.api.nvim_set_keymap("n","<leader>ff","<cmd>lua require('telescope.builtin').git_files()<cr>", { noremap = true })



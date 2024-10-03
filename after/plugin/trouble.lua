local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
    return
end

trouble.setup {
    icons = false,
    fold_open = "v",      -- icon used for open folds
    fold_closed = ">",    -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
     warn_no_results = false,
    open_no_results = true,
    signs = {
        -- icons / text used for a diagnostic
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
}

vim.keymap.set("n", "<C-d>", function() require("trouble").toggle("diagnostics") end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "<leader>xr", function() require("trouble").toggle("lsp_references") end)

vim.keymap.set("n", "<leader>xn", function() require("trouble").next({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<leader>xp", function() require("trouble").previous({ skip_groups = true, jump = true }) end)

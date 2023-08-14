vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = {"*.v", "*.vsh", "*.vv"},
        command = "set filetype=v",
})

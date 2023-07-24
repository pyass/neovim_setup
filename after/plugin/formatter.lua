-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  return
end

formatter.setup {
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        python = {
            -- "formatter.filetypes.lua" defines default configurations for the
            -- "lua" filetype
            require("formatter.filetypes.python").black,

            -- You can also define your own configuration
        },

    }
}

local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
    return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
    return
end

local mason_dap_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not mason_dap_ok then
    return
end

mason_dap.setup {
    -- Makes a best effort to setup the various debuggers with
    -- reasonable debug configurations
    automatic_setup = true,

    -- You can provide additional configuration to the handlers,
    -- see mason-nvim-dap README for more information
    handlers = {
        function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            mason_dap.default_setup(config)
        end,
        python = function(config)
            config.adapters = {
                type = "executable",
                command = "/usr/bin/python3",
                args = {
                    "-m",
                    "debugpy.adapter",
                },
            }
            mason_dap.default_setup(config) -- don't forget this!
        end,
    },

    -- You'll need to check that you have the required things installed
    -- online, please don't ask me how to install them :)
    ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'python',
    },
}

vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<leader>dsi', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<leader>dsv', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<leader>dso', dap.step_out, { desc = 'Debug: Step Out' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dB', function()
    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = 'Debug: Set Breakpoint' })


dapui.setup {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has "nvim-0.7",
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                -- "stacks",
                -- "watches",
            },
            size = 40, -- 40 columns
            position = "right",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
    },
}

vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = 'Debug: See last session result.' })

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open {}
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close {}
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close {}
end

local pydap_ok, pydap = pcall(require, "nvim-dap-python")
if not pydap_ok then
    return
end

pydap.setup {}

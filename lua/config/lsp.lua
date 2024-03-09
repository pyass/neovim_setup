-- local mason_ok, mason = pcall(require, "mason")
-- if not mason_ok then
--     return
-- end
--
-- mason.setup({})

vim.keymap.set("n", "<leader>lo", "<cmd>:LspLog<CR>", { noremap = true })
vim.keymap.set("n", "<leader>li", "<cmd>:LspInfo<CR>", { noremap = true })
vim.keymap.set("n", "<leader>lr", "<cmd>:LspRestart<CR>", { noremap = true })
-- vim.keymap.set("n","]]", vim.diagnostic.goto_next{ border = "rounded" },{ noremap = true })
-- vim.keymap.set("n","[[", vim.diagnostic.goto_prev{ border = "rounded" },{ noremap = true })
-- vim.keymap.set("n","<leader>fo", vim.lsp.buf.format { async = true }, { noremap = true })
--
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		local builtin = require("telescope.builtin")
		map("gl", vim.diagnostic.open_float, "[G]oto [L]ine")
		map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
		map("gi", builtin.lsp_implementations, "[G]oto [I]mplementations")
		map("gr", vim.lsp.buf.references, "[G]oto [R]eference")
		map("rn", vim.lsp.buf.rename, "[R]e[N]ame")
		map("ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
		map("K", vim.lsp.buf.hover, "[K|H]over")
		map("<leader>ll", vim.diagnostic.setloclist, "[L]ocal [L]ist")
		map("<leader>gt", builtin.lsp_type_definitions, "[G]oto [T]ype")
		map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	lua_ls = {
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
			},
		},
	},
}

require("mason").setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua", -- Used to format lua code
})
-- require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			require("lspconfig")[server_name].setup({
				cmd = server.cmd,
				settings = server.settings,
				filetypes = server.filetypes,
				capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
			})
		end,
	},
})

-- local cmp = require("cmp")
-- local luasnip = require("luasnip")
-- luasnip.config.setup({})
--
-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			luasnip.lsp_expand(args.body)
-- 		end,
-- 	},
-- 	completion = { completeopt = "menu,menuone,noinsert" },
--
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- Select the [n]ext item
-- 		["<C-n>"] = cmp.mapping.select_next_item(),
-- 		-- Select the [p]revious item
-- 		["<C-p>"] = cmp.mapping.select_prev_item(),
--
-- 		-- Accept ([y]es) the completion.
-- 		--  This will auto-import if your LSP supports it.
-- 		--  This will expand snippets if the LSP sent a snippet.
-- 		["<C-y>"] = cmp.mapping.confirm({ select = true }),
-- 		-- Manually trigger a completion from nvim-cmp.
-- 		--  Generally you don't need this, because nvim-cmp will display
-- 		--  completions whenever it has completion options available.
-- 		["<C-Space>"] = cmp.mapping.complete({}),
--
-- 		["<C-l>"] = cmp.mapping(function()
-- 			if luasnip.expand_or_locally_jumpable() then
-- 				luasnip.expand_or_jump()
-- 			end
-- 		end, { "i", "s" }),
-- 		["<C-h>"] = cmp.mapping(function()
-- 			if luasnip.locally_jumpable(-1) then
-- 				luasnip.jump(-1)
-- 			end
-- 		end, { "i", "s" }),
-- 	}),
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "luasnip" },
-- 		{ name = "path" },
-- 	},
-- })
-- local cmp = require("cmp")
--
-- -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
-- lsp.on_attach(function(_, bufnr)
--     local opts = { noremap = true, silent = true }
-- end)
--
-- -- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- -- if not snip_status_ok then
-- --     return
-- -- end
-- --
-- -- require("luasnip/loaders/from_vscode").lazy_load()
-- --
--
-- local check_backspace = function()
--     local col = vim.fn.col "." - 1
--     return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
-- end
--
-- local cmp_config = lsp.defaults.cmp_config({
--     snippet = {
--         expand = function(args)
--             luasnip.lsp_expand(args.body) -- For `luasnip` users.
--         end,
--     },
--     mapping = {
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--         ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--         ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--         ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         ["<C-e>"] = cmp.mapping {
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close(),
--         },
--         -- Accept currently selected item. If none selected, `select` first item.
--         -- Set `select` to `false` to only confirm explicitly selected items.
--         ["<CR>"] = cmp.mapping.confirm { select = true },
--         ["<Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_next_item()
--             elseif luasnip.expandable() then
--                 luasnip.expand()
--             elseif luasnip.expand_or_jumpable() then
--                 luasnip.expand_or_jump()
--             elseif check_backspace() then
--                 fallback()
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--         ["<S-Tab>"] = cmp.mapping(function(fallback)
--             if cmp.visible() then
--                 cmp.select_prev_item()
--             elseif luasnip.jumpable(-1) then
--                 luasnip.jump(-1)
--             else
--                 fallback()
--             end
--         end, {
--             "i",
--             "s",
--         }),
--     },
--     sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = "path" },
--     },
--     confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false,
--     },
--     experimental = {
--         ghost_text = false,
--         native_menu = false,
--     },
-- })
--
-- cmp.setup(cmp_config)
--
-- LSP configs

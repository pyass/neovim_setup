vim.keymap.set("n", "<leader>lo", "<cmd>:LspLog<CR>", { noremap = true })
vim.keymap.set("n", "<leader>li", "<cmd>:LspInfo<CR>", { noremap = true })
vim.keymap.set("n", "<leader>lr", "<cmd>:LspRestart<CR>", { noremap = true })
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
	"pyright",
	"tsserver",
	"bashls"
})
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

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


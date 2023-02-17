local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_config = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason.setup()

mason_config.setup()

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("handlers").on_attach,
		capabilities = require("handlers").capabilities,
	}

	 if server.name == "pyright" then
	 	local pyright_opts = require("settings.pyright")
	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	 end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)


local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("handlers").setup()

lspconfig.on_server_ready(function(server)
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


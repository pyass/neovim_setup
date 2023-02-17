local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, mason_config = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason.setup()

mason_config.setup {
    ensure_installed = { "pyright", "tsserver", "lua_ls", "bash_ls" },
    automatic_installion = true
}



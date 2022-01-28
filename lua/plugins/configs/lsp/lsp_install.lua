local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print("Warning: Cannot find lsp_installer")
	return
end

local servers = {
  -- "bashls",
  -- "cssls",
  -- "dockerls",
  -- "emmet_ls",
  -- "eslint",
  -- "graphql",
  -- "html",
  -- "pyright",
  -- "remark_ls",
  -- "jsonls",
  "sumneko_lua",
  "tsserver",
  -- "vimls",
}

for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. lsp_name .. "...")
    server:install()
  end
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

lsp_installer.on_server_ready(function(server)
  print("starting" .. server.name)
	local opts = {
		on_attach = require("plugins.configs.lsp.handlers").on_attach,
		capabilities = require("plugins.configs.lsp.handlers").capabilities(),
	}

	 if server.name == "sumneko_lua" then
	 	local settings = require("plugins.configs.lsp.settings.sumneko_lua")
	 	opts = vim.tbl_deep_extend("force", settings, opts)
	 end

	server:setup(opts)
end)


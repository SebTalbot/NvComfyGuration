local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  print "Warning: Cannot find lsp_installer"
  return
end

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "emmet_ls",
  "eslint",
  "gopls",
  "graphql",
  "html",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "vimls",
}

for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("[LSP] Installing " .. lsp_name .. "...")
    server:install()
  end
end

lsp_installer.settings {
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
}

local custom_settings = {
  jsonls = "plugins.configs.lsp.settings.jsonls",
  sumneko_lua = "plugins.configs.lsp.settings.sumneko_lua",
  tsserver = "plugins.configs.lsp.settings.tsserver",
}

local use_custom_settings = function(server_name, default_opts)
  if custom_settings[server_name] then
    local settings = require(custom_settings[server_name])
    return vim.tbl_deep_extend("force", default_opts, settings)
  end
  return default_opts
end

lsp_installer.on_server_ready(function(server)
  local default_opts = {
    on_attach = require("plugins.configs.lsp.handlers").on_attach,
    capabilities = require("plugins.configs.lsp.handlers").capabilities(),
  }
  local opts = use_custom_settings(server.name, default_opts)
  server:setup(opts)
end)

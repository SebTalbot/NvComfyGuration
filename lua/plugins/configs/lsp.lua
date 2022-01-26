local lsp_installer = require("nvim-lsp-installer")

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "emmet_ls",
  "eslint",
  "graphql",
  "html",
  "pyright",
  "remark_ls",
  "jsonls",
  "sumneko_lua",
  "tsserver",
  "vimls",
}

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
  local options = {  }
  if server.name == "sumneko_lua" then
    options.settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use", "require", "pairs", "print" }
        }
      }
    }
  end
  server:setup(options)
  vim.cmd([[ do User LspAttach Buffers ]])
end)

for _, lsp_name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(lsp_name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. lsp_name .. "...")
    server:install()
  end
end

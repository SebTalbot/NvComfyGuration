local present, lsp_installer = pcall(require, "mason-lspconfig")
if not present then
  print("Warning: Cannot find lsp_installer")
  return
end

lsp_installer.setup({
  automatic_installation = true,
})

local installer_present, mason_installer = pcall(require, "mason-tool-installer")
if not installer_present then
  print("Warning: Cannot find mason-tool-installer")
  return
end

mason_installer.setup({
  ensure_installed = {
    "goimports-reviser",
    "shopify-cli",
    "shopify-theme-check",
    "tree-sitter-cli",
    "vue-language-server",
    "yaml-language-server",
  },
})

local lspconfig_present, lspconfig = pcall(require, "lspconfig")
if not lspconfig_present then
  print("Warning: Cannot find lspconfig")
  return
end

local handlers = require("plugins.configs.lsp.handlers")

lspconfig.bashls.setup(handlers.inject({}))
lspconfig.cssls.setup(handlers.inject({}))
lspconfig.dockerls.setup(handlers.inject({}))
lspconfig.emmet_ls.setup(handlers.inject({}))
lspconfig.eslint.setup(handlers.inject({}))
lspconfig.gopls.setup(handlers.inject({}))
lspconfig.graphql.setup(handlers.inject({}))
lspconfig.html.setup(handlers.inject({}))
lspconfig.jsonls.setup(handlers.inject(require("plugins.configs.lsp.settings.jsonls")))
lspconfig.lua_ls.setup(handlers.inject(require("plugins.configs.lsp.settings.lua_ls")))
lspconfig.shopify_theme_ls.setup(handlers.inject({}))
lspconfig.pyright.setup(handlers.inject({}))
lspconfig.taplo.setup(handlers.inject({}))
lspconfig.ts_ls.setup(handlers.inject(require("plugins.configs.lsp.settings.tsserver")))
lspconfig.vimls.setup(handlers.inject({}))
lspconfig.yamlls.setup(handlers.inject({}))

-- @TODO Move to setting file
lspconfig.volar.setup(handlers.inject({
  init_options = {
    vue = {
      hybridMode = false,
      maxOldSpaceSize = 8096,
    },
  },
}))

lspconfig.theme_check.setup(handlers.inject({
  root_dir = function(fname)
    return vim.loop.cwd()
  end,
}))

require("plugins.configs.lsp.handlers").setup()
require("plugins.configs.lsp.null_ls")

function _LspCustomFormat()
  vim.lsp.buf.format({
    filter = function(client)
      -- ignore volar
      return client.name ~= "volar"
    end,
  })
end

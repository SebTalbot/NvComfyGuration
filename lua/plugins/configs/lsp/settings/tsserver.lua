local mason_registry = require("mason-registry")
local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path() .. "/node_modules/@vue/language-server"

return {
  server = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_language_server_path,
          languages = { "vue" },
        },
      },
      preferences = {
        allowRenameOfImportPath = true,
        importModuleSpecifierEnding = "auto",
        importModuleSpecifierPreference = "non-relative",
        includeCompletionsForImportStatements = true,
        includeCompletionsForModuleExports = true,
        quotePreference = "single",
      },
    },
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      require("plugins.configs.lsp.handlers").on_attach(client, bufnr)
    end,
  },
}

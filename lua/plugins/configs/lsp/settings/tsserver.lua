require("typescript").setup({
  server = {
    init_options = {
      preferences = {
        allowRenameOfImportPath = true,
        importModuleSpecifierEnding = "auto",
        importModuleSpecifierPreference = "non-relative",
        includeCompletionsForImportStatements = true,
        includeCompletionsForModuleExports = true,
        quotePreference = "single",
      },
    },
    on_attach = function(client, bufnr)
      client.server_capabilities.document_formatting = false
      require("plugins.configs.lsp.handlers").on_attach(client, bufnr)
    end,
  },
})

local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
  print("Warning: Cannot find Treesitter configs")
  return
end

-- vim.opt.runtimepath:append "~/.local/share/nvim/lazy/tree-sitter"

configs.setup({
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "gitignore",
    "go",
    "gomod",
    "gosum",
    "gotmpl",
    "graphql",
    "html",
    "javascript",
    "json",
    "liquidsoap",
    "lua",
    "markdown",
    "printf",
    "python",
    "regex",
    "scss",
    "sql",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  -- Plugins
  autopairs = {
    enable = true,
  },

  -- parser_install_dir = "~/.local/share/nvim/lazy/tree-sitter",
})

local parsers_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status_ok then
  print("Warning: Cannot find Treesitter parsers")
  return
end

vim.treesitter.language.register("javascript", "tsx")
vim.treesitter.language.register("typescript", "tsx")

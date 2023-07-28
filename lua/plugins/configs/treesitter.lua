local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
  print "Warning: Cannot find Treesitter configs"
  return
end

configs.setup {
  ensure_installed = {
    "bash",
    "css",
    "dockerfile",
    "go",
    "gomod",
    -- "help", broken for now
    "gitignore",
    "tsx",
    "graphql",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "python",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "vim",
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
  context_commentstring = {
    enable = true,
  },
}

local parsers_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status_ok then
  print "Warning: Cannot find Treesitter parsers"
  return
end

vim.treesitter.language.register("javascript", "tsx")
vim.treesitter.language.register("typescript", "tsx")

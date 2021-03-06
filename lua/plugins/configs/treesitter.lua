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
    "graphql",
    "html",
    "html",
    "javascript",
    "json",
    "markdown",
    "python",
    "regex",
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
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}

local parsers_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status_ok then
  print "Warning: Cannot find Treesitter parsers"
  return
end

local ft_to_parser = parsers.filetype_to_parsername
ft_to_parser.javascript = "tsx"
ft_to_parser.typescript = "tsx"

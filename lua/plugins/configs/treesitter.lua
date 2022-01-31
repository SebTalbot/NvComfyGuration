local configs_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not configs_status_ok then
  print("Warning: Cannot find Treesitter configs")
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
  rainbow = {
    enable = true,
    extended_mode = true,
  },
}

local parsers_status_ok, parsers = pcall(require, "nvim-treesitter.parsers")
if not parsers_status_ok then
  print("Warning: Cannot find Treesitter parsers")
  return
end

local parser_config = parsers.get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }

-- Setting up

-- nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Loading custom files
local modules = {
  "core.autocommands",
  "core.options",
  "core.mappings",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

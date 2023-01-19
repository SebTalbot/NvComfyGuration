local options = {
  clipboard = "unnamedplus",
  colorcolumn = "80",
  conceallevel = 0,
  cursorline = true,
  expandtab = true,
  ignorecase = true,
  linebreak = true,
  mouse = "",
  number = true,
  relativenumber = true,
  scrolloff = 4,
  shiftwidth = 2,
  showmatch = true,
  smartcase = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  undodir = vim.fn.stdpath "config" .. "/undo",
  undofile = true,
  updatetime = 500,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd [[let g:loaded_perl_provider = 0]]

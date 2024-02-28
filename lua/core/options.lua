local options = {
  clipboard = "unnamedplus",
  colorcolumn = "80",
  conceallevel = 0,
  cursorline = true,
  expandtab = true,
  foldenable = true,
  foldlevel = 99,
  foldmethod = "expr",
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
  undodir = vim.fn.stdpath("config") .. "/undo",
  undofile = true,
  updatetime = 500,
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd([[ let g:loaded_perl_provider = 0 ]])
vim.cmd([[ set title titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')} ]])
vim.cmd([[ set foldexpr=nvim_treesitter#foldexpr() ]])

-- Set pyenv virtual env if exists
local pyenv_root = io.popen([[pyenv root]])
if pyenv_root then
  local pyenv_root_path = pyenv_root:read("*a")
  pyenv_root:close()
  local venv_path = pyenv_root_path:gsub("\n", "") .. "/versions/py3nvim/bin/python"
  local test_venv = io.open(venv_path, "r")
  local venv_exists = test_venv ~= nil and io.close(test_venv)
  if venv_exists then
    vim.g.python3_host_prog = venv_path
  end
end

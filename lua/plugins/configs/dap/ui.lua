local present, dapui = pcall(require, "dapui")
if not present then
  print("Warning: Cannot find DAP")
  return false
end

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = true,
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 60,
      position = "left",
    },
    {
      elements = {
        -- "console",
        "repl",
      },
      size = 0.25,
      position = "bottom",
    },
  },
  controls = {
    enabled = false,
  },
  floating = {
    max_height = nil,
    max_width = nil,
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil,
  },
})

vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = " ", texthl = "", linehl = "", numhl = "" })

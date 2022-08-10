local dapPresent, dap = pcall(require, "dap")
if not dapPresent then
  print "Warning: Cannot find DAP"
  return false
end

local dapJsPresent, dapJs = pcall(require, "dap-vscode-js")
if not dapJsPresent then
  print "Warning: Cannot find dap-vscode-js"
  return false
end

dapJs.setup {
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require("dap.utils").pick_process,
      cwd = "${workspaceFolder}",
    },
  }
end

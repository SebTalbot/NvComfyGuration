local present, dapgo = pcall(require, "dap-go")
if not present then
  print "Warning: Cannot find dap-go"
  return false
end

local handle = io.popen "dlv version"
local isDebuggerInstalled = handle:read "l" == "Delve Debugger"
if not isDebuggerInstalled then
  print "Warning: dap-go needs the delve debugger to be installed systeme wise. Disable the package if you dont want to use dap-go"
  return false
end

dapgo.setup()

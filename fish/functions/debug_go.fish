function godbg --description 'start the dlv server at the provided port'
  dlv dap -l $argv[1] --log --log-output="dap"
end

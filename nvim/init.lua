-- impatient has to be loaded before anything else
local present, impatient = pcall(require, 'impatient')
if present then
  impatient.enable_profile()
end

require('disable-builtins')
require('general')
require('keybindings')
require('plugins')
require('colors')
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require("auto_exec")
require("general")
require("keybindings")
require("plugins")
require("colors")

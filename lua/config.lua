
-- general
-------------------------------------------------------
vim.g.maplocalleader = ','


-- timeing:
-------------------------------------------------------
vim.opt.timeoutlen=300   --- Time out on mappings
vim.opt.ttimeoutlen=10   --- Time out on key codes
vim.opt.updatetime=200   --- Idle time to write swap and trigger CursorHold
vim.opt.redrawtime=2000  --- Time in milliseconds for stopping display redraw

-- colors:
-------------------------------------------------------
-- lvim.colorscheme = "one-nvim" --  "onedarker"
vim.o.background = 'light'

-- load specific configurations
-------------------------------------------------------
require("config.commands")
require("config.mappings")

require("config.plugins.nvimtree")
require("config.plugins.telescope")
require("config.plugins.dap")
require("config.plugins.lsp")
require("config.plugins.trouble")
-- require("plugins.vimwiki")
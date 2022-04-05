
-- general
-------------------------------------------------------
-- see, e.g.: https://icyphox.sh/blog/nvim-lua/
vim.g.maplocalleader = ','
vim.wo.relativenumber = false
vim.o.number = true
vim.wo.number = true
-- vim.o.cmdheight=2

-- timeing:
-------------------------------------------------------
vim.opt.timeoutlen=300   --- Time out on mappings
vim.opt.ttimeoutlen=10   --- Time out on key codes
vim.opt.updatetime=200   --- Idle time to write swap and trigger CursorHold
vim.opt.redrawtime=2000  --- Time in milliseconds for stopping display redraw

-- colors:
-------------------------------------------------------
-- lvim.colorscheme = "one-nvim" --  "onedarker"
-- lvim.colorscheme = "tokyonight"
vim.o.background = 'light'



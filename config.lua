--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- Packages

require("install.plugins")

-----------------------------------------------------------------------
-- Load local init:
-----------------------------------------------------------------------
vim.cmd([[
  echom expand('<sfile>')
  let g:local_source_dir = fnamemodify(expand('<sfile>'), ':h').'/local/'

let g:path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/')
let g:nvim_dir = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.g:path_sep.'?')  " see :h filename-modifiers  /  use $VIM_PATH

" load you local settings
if filereadable(g:local_source_dir . 'init.vim')
	execute 'source ' . g:local_source_dir . 'init.vim'
endif

" -----------------------------------------------------------------------
" -- Load other local file other than the init-file
" -----------------------------------------------------------------------
if exists('g:local_source_dir') " && isdirectory(g:local_source_dir)
    echom split(globpath(g:local_source_dir, '*.vim'), '\n')
   for file in split(globpath(g:local_source_dir, '*.vim'), '\n')
      " local/init.vim already loaded in init.vim (main init.vim file in parent directory)
      if file == g:local_source_dir . 'init.vim'
	        continue
      endif
      execute 'source' file
   endfor
endif
]])

-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

--- Timing {{{
-- vim.opt.timeout=true
-- vim.opt.ttimeout=true
vim.opt.timeoutlen=400   --- Time out on mappings
vim.opt.ttimeoutlen=10   --- Time out on key codes
vim.opt.updatetime=200   --- Idle time to write swap and trigger CursorHold
vim.opt.redrawtime=2000  --- Time in milliseconds for stopping display redraw

-- vim.g.mapleader = ' '
vim.g.maplocalleader = ','

--- }}}

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "one"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-------------------------------------------------------
-- add your own keymapping
-------------------------------------------------------
-- require('config.plugins.neuron')

-- To remove keymappings set by Lunarvim
-- lvim.keys.normal_mode["<S-h>"] = false

lvim.builtin.which_key.mappings = {
  ["c"] = { },
  ["w"] = { },
}

require('config.mappings')
-- local mapfile = loadfile('config.mappings.lua')
-- mapfile()

-- TODO: unmap <c-z>

require('config.plugins.telescope')
-------------------------------------------------------------
-- Functions
-------------------------------------------------------------

vim.cmd([[
  command! KeyMaps :call utils#KeyMaps()
  " save and quit
  command! W :w!
  command! Q :q
  cnoreabbrev <silent> ww w!
  cnoreabbrev <silent> wwa wa!
  cnoreabbrev <silent> xx x!
  cnoreabbrev <silent> xxa xa!
  cnoreabbrev <silent> qq q!
  cnoreabbrev <silent> qqa qa!
  cnoreabbrev <silent> ee e!
]])
-------------------------------------------------------------
-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

lvim.builtin.dap.active = true

-- if you don't want all the parsers change this to a table of the ones you want

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  -- "javascript", -- requires yarn / npm installed
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- ============== new ===================== 
-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  -- {
  --   exe = "prettier",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "typescript", "typescriptreact" },
  -- },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { exe = "black" },
  -- {
    -- exe = "eslint_d",
    -- ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    -- filetypes = { "javascript", "javascriptreact" },
  -- },
}
-- ===========================================




-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

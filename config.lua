--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

--- Timing {{{
-- vim.opt.timeout=true
-- vim.opt.ttimeout=true
vim.opt.timeoutlen=250   --- Time out on mappings
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
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

vim.api.nvim_set_keymap('', '<c-PageUp>', "<Cmd>bp<CR>", {})
vim.api.nvim_set_keymap('', '<c-DownUp>', "<Cmd>bn<CR>", {})
-- vim.api.nvim_set_keymap('', '<A-j>', "<Cmd>bp<CR>", {})
-- vim.api.nvim_set_keymap('', '<A-k>', "<Cmd>bn<CR>", {})

vim.api.nvim_set_keymap('', '<localleader>a', "<Cmd>NvimTreeToggle<CR>", {})

vim.api.nvim_set_keymap('', '<localleader>e', "<Cmd>NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap('', '<localleader>a', "<Cmd>NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap('', '<c-b>', ":bd<CR>", { })

vim.cmd([[
  cnoremap <expr> <Up>  pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
]])

vim.cmd([[
    nnoremap  [Window]   <Nop>
    nmap      w [Window]
    nnoremap [Window]b  <cmd>buffer#<CR>
    nnoremap [Window]c  <cmd>close<CR>
    nnoremap [Window]d  <cmd>bdelete<CR>
    nnoremap [Window]h  <cmd>split<CR>
    nnoremap [Window]v  <cmd>vsplit<CR>
    nnoremap [Window]t  <cmd>tabnew<CR>
    nnoremap [Window]o  <cmd>only<CR>
    nnoremap [Window]q  <cmd>quit<CR>
    nnoremap [Window]x  <cmd>call utils#window_empty_buffer()<CR>
    nnoremap [Window]z  <cmd>call utils#zoom()<CR>

    " Split current buffer, go to previous window and previous buffer
    nnoremap [Window]h <cmd>split<CR>:wincmd p<CR>:e#<CR>
    nnoremap [Window]v <cmd>vsplit<CR>:wincmd p<CR>:e#<CR>

    nmap [Window]g <cmd>call utils#toggle_background()<CR>

		nnoremap <silent> [Window]n  :tabnext<CR>
		nnoremap <silent> [Window]p  :tabprev<CR>
]])


local preloadTelescope = function()
	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- General pickers
	keymap('n', '<localleader>r', '<cmd>Telescope resume<CR>', opts)
	keymap('n', '<localleader>R', '<cmd>Telescope pickers<CR>', opts)
	keymap('n', '<localleader>f', '<cmd>Telescope find_files<CR>', opts)
	keymap('n', '<localleader>g', '<cmd>Telescope live_grep<CR>', opts)
	keymap('n', '<localleader>b', '<cmd>Telescope buffers<CR>', opts)
	keymap('n', '<localleader>h', '<cmd>Telescope highlights<CR>', opts)
	keymap('n', '<localleader>j', '<cmd>Telescope jumplist<CR>', opts)
	keymap('n', '<localleader>m', '<cmd>Telescope marks<CR>', opts)
	keymap('n', '<localleader>o', '<cmd>Telescope vim_options<CR>', opts)
	keymap('n', '<localleader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
	keymap('n', '<localleader>v', '<cmd>Telescope registers<CR>', opts)
	keymap('n', '<localleader>u', '<cmd>Telescope spell_suggest<CR>', opts)
	keymap('n', '<localleader>s', '<cmd>Telescope session-lens search_session<CR>', opts)
	keymap('n', '<localleader>x', '<cmd>Telescope oldfiles<CR>', opts)
	keymap('n', '<localleader>z', '<cmd>lua require"plugins.telescope".pickers.zoxide()<CR>', opts)
	keymap('n', '<localleader>;', '<cmd>Telescope command_history<CR>', opts)
	keymap('n', '<localleader>/', '<cmd>Telescope search_history<CR>', opts)

	-- git_commits    git_bcommits   git_branches
	-- git_status     git_stash      git_files
	-- file_browser   tags           fd             autocommands   quickfix
	-- filetypes      commands       man_pages      help_tags      loclist
	-- lsp_workspace_diagnostics     lsp_document_diagnostics

	-- Location-specific find files/directories
	keymap('n', '<localleader>n', '<cmd>lua require"plugins.telescope".pickers.plugin_directories()<CR>', opts)
	keymap('n', '<localleader>w', '<cmd>lua require"plugins.telescope".pickers.notebook()<CR>', opts)

	-- Navigation
	keymap('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
	keymap('n', '<leader>gt', '<cmd>lua require"plugins.telescope".pickers.lsp_workspace_symbols_cursor()<CR>', opts)
	keymap('n', '<leader>gf', '<cmd>lua require"plugins.telescope".pickers.find_files_cursor()<CR>', opts)
	keymap('n', '<leader>gg', '<cmd>lua require"plugins.telescope".pickers.grep_string_cursor()<CR>', opts)
	keymap('x', '<leader>gg', '<cmd>lua require"plugins.telescope".pickers.grep_string_visual()<CR>', opts)

	-- LSP related
	keymap('n', '<localleader>dd', '<cmd>Telescope lsp_definitions<CR>', opts)
	keymap('n', '<localleader>di', '<cmd>Telescope lsp_implementations<CR>', opts)
	keymap('n', '<localleader>dr', '<cmd>Telescope lsp_references<CR>', opts)
	keymap('n', '<localleader>da', '<cmd>Telescope lsp_code_actions<CR>', opts)
	keymap('x', '<localleader>da', ':Telescope lsp_range_code_actions<CR>', opts)
end

preloadTelescope()

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
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

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

-- ============== old ===================== 
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }

-- -- set an additional linter
-- lvim.lang.python.linters = {
-- -- set additional linters
--   { exe = "black" },
--   { exe = "flake8" }
-- }

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
  { exe = "black" },
  {
    exe = "eslint_d",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact" },
  },
}
-- ===========================================


-- Additional Plugins
lvim.plugins = {
    {"folke/tokyonight.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },
    {"rakr/vim-one"}
}


-- if dein#tap('todo-comments.nvim')
-- 	nnoremap <LocalLeader>dt <cmd>TodoTelescope<CR>
-- endif
-- require('todo-comments').setup({
-- 	signs = false,




-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

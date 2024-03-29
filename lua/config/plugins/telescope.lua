-- local M = {}

-- close telescope with q
vim.cmd('au! Filetype TelescopePrompt nmap q <esc>')

vim.cmd('command! Zoxide lua require"plugins.telescope".pickers.zoxide()')

-- M.preloadTelescope = function()
local preloadTelescope = function()
	local keymap = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }

	-- General pickers
	keymap('n', '<localleader>b', '<cmd>Telescope buffers<CR>', opts)
	keymap('n', '<localleader>f', '<cmd>Telescope find_files<CR>', opts)
	keymap('n', '<localleader>g', '<cmd>Telescope live_grep<CR>', opts)
	keymap('n', '<localleader>h', '<cmd>Telescope highlights<CR>', opts)
	keymap('n', '<localleader>H', '<cmd>Telescope search_history<CR>', opts)
	keymap('n', '<localleader>j', '<cmd>Telescope jumplist<CR>', opts)
	keymap('n', '<localleader>m', '<cmd>Telescope marks<CR>', opts)
	keymap('n', '<localleader>p', '<cmd>Telescope projects<CR>', opts)
  -- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
	keymap('n', '<localleader>o', '<cmd>Telescope vim_options<CR>', opts)
	keymap('n', '<localleader>r', '<cmd>Telescope resume<CR>', opts)
	keymap('n', '<localleader>R', '<cmd>Telescope pickers<CR>', opts)
	keymap('n', '<localleader>s', '<cmd>Telescope session-lens search_session<CR>', opts)
	keymap('n', '<localleader>t', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
	keymap('n', '<localleader>u', '<cmd>Telescope spell_suggest<CR>', opts)
	keymap('n', '<localleader>v', '<cmd>Telescope registers<CR>', opts)
	keymap('n', '<localleader>x', '<cmd>Telescope oldfiles<CR>', opts)
	keymap('n', '<localleader>z', '<cmd>Zoxide<CR>', opts)
	-- keymap('n', '<localleader>z', '<cmd>lua require"plugins.telescope".pickers.zoxide()<CR>', opts)
	keymap('n', '<localleader>;', '<cmd>Telescope command_history<CR>', opts)
  keymap('n', '<localleader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)

	-- git_commits    git_bcommits   git_branches
	-- git_status     git_stash      git_files
	-- file_browser   tags           fd             autocommands   quickfix
	-- filetypes      commands       man_pages      help_tags      loclist
	-- lsp_workspace_diagnostics     lsp_document_diagnostics

	-- Location-specific find files/directories
	keymap('n', '<localleader>n', '<cmd>lua require"plugins.telescope".pickers.plugin_directories()<CR>', opts)
	keymap('n', '<localleader>w', '<cmd>lua require"plugins.telescope".pickers.notebook()<CR>', opts)

	-- Navigation
	-- keymap('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<CR>', opts)
	-- keymap('n', '<leader>gt', '<cmd>lua require"plugins.telescope".pickers.lsp_workspace_symbols_cursor()<CR>', opts)
	-- keymap('n', '<leader>gf', '<cmd>lua require"plugins.telescope".pickers.find_files_cursor()<CR>', opts)
	-- keymap('n', '<leader>gg', '<cmd>lua require"plugins.telescope".pickers.grep_string_cursor()<CR>', opts)
	keymap('x', '<leader>gg', '<cmd>lua require"plugins.telescope".pickers.grep_string_visual()<CR>', opts)

  lvim.builtin.which_key.mappings["gb"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer" }
  -- lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer" }

  -- FIX:
  -- lvim.builtin.which_key.mappings["gt"] = { '<cmd>lua require"plugins.telescope".pickers.lsp_workspace_symbols_cursor()<CR>', "Symbols" }
  -- lvim.builtin.which_key.mappings["gf"] = { '<cmd>lua require"plugins.telescope".pickers.find_files_cursor()<CR>', "Files cursor" }
  -- lvim.builtin.which_key.mappings["g???"] = { '<cmd>lua require"plugins.telescope".pickers.grep_string_cursor()<CR>', "String cursor" }

	-- LSP related
	keymap('n', '<localleader>dd', '<cmd>Telescope lsp_definitions<CR>', opts)
	keymap('n', '<localleader>di', '<cmd>Telescope lsp_implementations<CR>', opts)
	keymap('n', '<localleader>dr', '<cmd>Telescope lsp_references<CR>', opts)
	keymap('n', '<localleader>da', '<cmd>Telescope lsp_code_actions<CR>', opts)
	keymap('x', '<localleader>da', ':Telescope lsp_range_code_actions<CR>', opts)
end

preloadTelescope()

-- return M

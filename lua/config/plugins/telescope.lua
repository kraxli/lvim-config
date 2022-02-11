
-- credit github.com/rafi

-- Telescope Helpers

-- Returns visually selected text
local visual_selection = function()
	local save_previous = vim.fn.getreg('a')
	vim.api.nvim_command('silent! normal! "ay')
	local selection = vim.fn.trim(vim.fn.getreg('a'))
	vim.fn.setreg('a', save_previous)
	return vim.fn.substitute(selection, [[\n]], [[\\n]], 'g')
end

-- Custom actions

local myactions = {}

function myactions.send_to_qflist(prompt_bufnr)
	require('telescope.actions').send_to_qflist(prompt_bufnr)
	require('user').qflist.open()
end

function myactions.smart_send_to_qflist(prompt_bufnr)
	require('telescope.actions').smart_send_to_qflist(prompt_bufnr)
	require('user').qflist.open()
end

function myactions.page_up(prompt_bufnr)
	require('telescope.actions.set').shift_selection(prompt_bufnr, -5)
end

function myactions.page_down(prompt_bufnr)
	require('telescope.actions.set').shift_selection(prompt_bufnr, 5)
end

function myactions.change_directory(prompt_bufnr)
	local entry = require('telescope.actions.state').get_selected_entry()
	require('telescope.actions').close(prompt_bufnr)
	vim.cmd('lcd ' .. entry.path)
end

-- Custom pickers

local pickers = {}

pickers.grep_string_visual = function()
	require'telescope.builtin'.live_grep({
		default_text = visual_selection(),
	})
end

pickers.grep_string_cursor = function()
	require'telescope.builtin'.live_grep({
		default_text = vim.fn.expand('<cword>'),
	})
end

pickers.find_files_cursor = function()
	require'telescope.builtin'.find_files({
		default_text = vim.fn.expand('<cword>'),
	})
end

pickers.lsp_workspace_symbols_cursor = function()
	require'telescope.builtin'.lsp_workspace_symbols({
		default_text = vim.fn.expand('<cword>'),
	})
end

pickers.zoxide = function()
	require'telescope'.extensions.zoxide.list({
		layout_config = {
			width = 0.5,
			height = 0.6,
		},
	})
end

pickers.notebook = function()
	require'telescope.builtin'.find_files({
		prompt_title = '[ Notebook ]',
		cwd = '$HOME/docs/blog',
	})
end

pickers.plugin_directories = function(opts)
	local utils = require('telescope.utils')
	local dir = vim.fn.expand('$VIM_DATA_PATH/dein/repos/github.com')

	opts = opts or {}
	opts.cmd = utils.get_default(opts.cmd, {
		vim.o.shell,
		'-c',
		'find '..vim.fn.shellescape(dir)..' -mindepth 2 -maxdepth 2 -type d',
	})

	local dir_len = dir:len()
	opts.entry_maker = function(line)
		return {
			value = line,
			ordinal = line,
			display = line:sub(dir_len + 2),
			path = line,
		}
	end

	require('telescope.pickers').new(opts, {
		layout_config = {
			width = 0.65,
			height = 0.7,
		},
		prompt_title = '[ Plugin directories ]',
		finder = require('telescope.finders').new_table{
			results = utils.get_os_command_output(opts.cmd),
			entry_maker = opts.entry_maker,
		},
		sorter = require('telescope.sorters').get_fuzzy_file(),
		previewer = require('telescope.previewers.term_previewer').cat.new(opts),
		attach_mappings = function(_, map)
			map('i', '<cr>', myactions.change_directory)
			map('n', '<cr>', myactions.change_directory)
			return true
		end
	}):find()
end


return {
	setup = setup,
	preload = preload,
	pickers = pickers,
}

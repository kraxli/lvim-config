
vim.cmd([[
	nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
	nnoremap <silent> <F7> :lua require'dap'.step_over()<CR>
	" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <F12> :lua require'dap'.step_into()<CR>
	nnoremap <silent> <space><F12> :lua require'dap'.step_out()<CR>
	" nnoremap <silent> <F10> :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <F8> :lua require'dap'.toggle_breakpoint()<CR>
	" nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
	nnoremap <silent> <space><F8> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
	nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
	nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
	" nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle()<CR>
	nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>`

	nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
	vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

	command! DapDisconnect :lua require('dap').disconnect()

	au! FileType dap-repl lua require('dap.ext.autocompl').attach()
  au! FileType dap-repl imap <shift> <c-x><c-o>

]])

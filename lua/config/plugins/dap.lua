
-- require('telescope').load_extension('dap')

if lvim.builtin.dap.active then
  vim.cmd([[
    nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
    nnoremap <silent> <F7> :lua require'dap'.step_over()<CR>
    " nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <F12> :lua require'dap'.step_into()<CR>
    nnoremap <silent> <space><F12> :lua require'dap'.step_out()<CR>
    nnoremap <silent> <space><F8> :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
    " nnoremap <silent> <F10> :lua require'dap'.toggle_breakpoint()<CR>
    nnoremap <silent> <F8> :lua require'dap'.toggle_breakpoint()<CR>
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


  -- THE FOLLOWING BLOCK WORKS:
  -- lvim.keys.normal_mode = {
  --   ['<leader>df'] = ':lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<cr>',
  --   ['<leader>de'] = ':lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression)<cr>',
  --   ['<leader>dh'] = ':lua require("dap.ui.widgets").hover()<cr>',
  -- }
  -- lvim.keys.normal_mode['<leader>dv'] = ':lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes)<cr>'

  lvim.builtin.which_key.mappings['de'] = { '<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression)<cr>', 'Expression'}
  lvim.builtin.which_key.mappings['df'] = { '<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<cr>', 'Frames'}
  lvim.builtin.which_key.mappings['dh'] = { '<cmd>lua require("dap.ui.widgets").hover()<cr>', 'Hover'}
  lvim.builtin.which_key.mappings['dv'] = { "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>", "Scope" }
  -- lvim.builtin.which_key.mappings['dq'] = { "<cmd>close<cr>", "Close float window" }

  lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
  lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" }

  -- lvim.autocommands.custom_groups = {
  --   { "FileType", "dap-float", "<cmd>nnoremap <buffer><silent> q <cmd>close!<CR>" },
  -- }
  vim.cmd('autocmd FileType dap-float nnoremap <buffer><silent> q <cmd>close!<CR>')

  -- Sidebars:
  -- local my_sidebar = widgets.sidebar(widgets.frames)
  -- my_sidebar.open()


  -- - open()
  -- - close()
  -- - toggle()
  -- lua  local widgets = require('dap.ui.widgets'); widgets.builder(widgets.scopes).new_buf(function_that_creates_and_returns_a_buffer).new_win(function_that_creates_and_returns_a_window)    .build()

end

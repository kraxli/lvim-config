
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

      au! FileType dap-repl imap <shift> <c-x><c-o>
      au! FileType dap-repl lua require('dap.ext.autocompl').attach()
    ]])

    lvim.builtin.which_key.mappings['dT'] = {"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "BP Conditional"}
    lvim.builtin.which_key.mappings['dL'] = {"<cmd>lua lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "BP Log point"}
    -- nnoremap <silent> <leader>dr :lua require'dap'.repl.toggle()<CR>
    lvim.builtin.which_key.mappings['dl'] = {"<cmd>require'dap'.repl.run_last()<CR>", "Run last"}

    lvim.builtin.which_key.mappings['dn'] = {"<cmd>lua require('dap-python').test_method()<CR>", "Test method"}
    lvim.builtin.which_key.mappings['dS'] = {"<cmdlua require('dap-python').debug_selection()<CR>", "Selection"}

    lvim.builtin.which_key.mappings['de'] = { '<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").expression)<cr>', 'Expression'}
    lvim.builtin.which_key.mappings['df'] = { '<cmd>lua require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames)<cr>', 'Frames'}
    lvim.builtin.which_key.mappings['dh'] = { '<cmd>lua require("dap.ui.widgets").hover()<cr>', 'Hover'}
    lvim.builtin.which_key.mappings['dv'] = { "<cmd>lua require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)<cr>", "Scope" }

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

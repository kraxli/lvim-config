local M = {}

M.unmapKeys = function ()
  -- unmap keys
  lvim.keys.normal_mode["<leader>c"] = false  -- close buffer: <c-b>
  lvim.keys.normal_mode["<leader>w"] = false  -- save: <c-q>
  lvim.keys.normal_mode["y"] = false
  lvim.keys.normal_mode["<s-x>"] = false
  lvim.keys.normal_mode["<c-z>"] = false
end

M.generalVimKeys = function()

  -- TODO: unmap q from recording use it to close telescope and buffers
  -- TODO: map Q to recording

  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  -- unmap a default keymapping
  -- lvim.keys.normal_mode["<C-Up>"] = ""
  -- edit a default keymapping

  vim.api.nvim_set_keymap('', '<c-b>', ":bd<CR>", { })
  lvim.keys.normal_mode["<C-q>"] = ":bd<cr>"
  lvim.keys.normal_mode["q"] = ":bd<cr>"
  -- vim.api.nvim_set_keymap('', '<c-b>', ":bd<CR>", {})

  vim.api.nvim_set_keymap('', '<c-PageDown>', "<Cmd>bp<CR>", {})
  vim.api.nvim_set_keymap('', '<c-PageUp>', "<Cmd>bn<CR>", {})
  -- vim.api.nvim_set_keymap('', '<A-j>', "<Cmd>bp<CR>", {})
  -- vim.api.nvim_set_keymap('', '<A-k>', "<Cmd>bn<CR>", {})

  -- toggle highlights (switch higlight no matter the previous state)
  lvim.keys.normal_mode["<leader>h"] = ':set hls! <cr>'
  -- " hit '/' highlights then enter search mode
  vim.api.nvim_set_keymap('n', '/',':set hlsearch<cr>/',  {noremap = true})
  -- prob. best option: nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

  vim.cmd([[
    " Include Time Stamps
    nnoremap <silent> <F4> "=strftime("%Y-%m-%d")<CR>P
    inoremap <silent> <F4> <C-R>=strftime("%Y-%m-%d")<CR>
    nnoremap <silent> <leader><F4> "=strftime("%H:%M")<CR>P
  ]])
  -- vim.api.nvim_set_keymap('', '<F4>', ':lua vim.api.nvim_buf_set_lines(0, vim.api.nvim_win_get_cursor(win)[1], vim.api.nvim_win_get_cursor(win)[1], false, {os.date("%Y-%m-%d")})<cr>', { })

  vim.cmd([[
    cnoremap <expr> <Up>  pumvisible() ? "\<C-p>" : "\<Up>"
    cnoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
  ]])

  -- TODO: potentially as the current behaviour has its own advantages
  -- vim.api.nvim_set_keymap("", "\\<Up>", "require('cmp').mapping.select_prev_item()", { expr = true, noremap = true })
  -- vim.api.nvim_set_keymap("", "\\<Down>", "require('cmp').mapping.select_next_item()", { expr = true, noremap = true })
  -- lvim.keys.normal_mode["wg"]  = '<cmd>call utils#toggle_background()<CR>'

  -- OPEN file, url, or directory
  lvim.keys.normal_mode["gx"] = false
  lvim.keys.normal_mode["<F6>"] = false

  commandsOpen = {unix="xdg-open", mac="open"}
  if vim.fn.has "mac" == 1 then osKey = "mac" elseif vim.fn.has "unix" == 1 then osKey = "unix" end
  local openFileUrl = [[<cmd>lua os.execute(commandsOpen[osKey] .. " " .. vim.fn.shellescape(vim.fn.expand "<cWORD>")); vim.cmd "redraw!"<cr>]]
  local openDir = [[<cmd>lua os.execute(commandsOpen[osKey] .. ' ' .. vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand('<sfile>'), ':p'))); vim.cmd "redraw!"<cr>]]
  local openAll = [[<cmd>lua cword = vim.fn.expand("<cWORD>"); if string.len(cword) ~= 0 then arg = vim.fn.shellescape(cword) else arg = vim.fn.shellescape(vim.fn.fnamemodify(vim.fn.expand("<sfile>"), ":p")) end; print(arg); os.execute(commandsOpen[osKey] .. ' ' .. arg); vim.cmd "redraw!"<cr>]]

  lvim.keys.normal_mode["<F6>"] = openDir
  -- lvim.keys.normal_mode["gx"] = openFileUrl
  lvim.keys.normal_mode["gx"] = openAll

  -- rafi
  vim.cmd([[
    " Re-select blocks after indenting in visual/select mode
    xnoremap < <gv
    xnoremap > >gv|

    " Use tab for indenting in visual/select mode
    xnoremap <Tab> >gv|
    xnoremap <S-Tab> <gv

    " Indent and jump to first non-blank character linewise
    nmap >  >>_
    nmap <  <<_
  ]])

  -- TODO: handle re-selct gv


  -- EXAMPLES:
  -- v  <Space>/    * <Esc><Cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>
  -- lvim.keys.normal_mode["gcc"] = "<Esc><Cmd>lua require('Comment.api').toggle_linewise_op()<CR>"
  -- lvim.keys.visual_mode["gcc"] = "* <Esc><Cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>"
  -- nnoremap <Leader>cw
  -- vim.api.nvim_set_keymap('n', '<c-c>', "<cmd>BufferClose!<CR>", {})
end

return M

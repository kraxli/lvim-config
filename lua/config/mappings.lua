

lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping

lvim.keys.normal_mode["<C-q>"] = "<cmd>BufferClose!<CR>"
lvim.keys.normal_mode["q"] = "<cmd>BufferClose!<CR>"
-- vim.api.nvim_set_keymap('n', '<c-c>', "<cmd>BufferClose!<CR>", {})


vim.api.nvim_set_keymap('', '<c-PageDown>', "<Cmd>bp<CR>", {})
vim.api.nvim_set_keymap('', '<c-PageUp>', "<Cmd>bn<CR>", {})
-- vim.api.nvim_set_keymap('', '<A-j>', "<Cmd>bp<CR>", {})
-- vim.api.nvim_set_keymap('', '<A-k>', "<Cmd>bn<CR>", {})

-- toggle highlights
-- " switch higlight no matter the previous state
lvim.keys.normal_mode["<leader>h"] = ':set hls! <cr>'
-- " hit '/' highlights then enter search mode
vim.api.nvim_set_keymap('n', '/',':set hlsearch<cr>/',  {noremap = true}) 
-- prob. best option: nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"


vim.api.nvim_set_keymap('', '<localleader>a', "<Cmd>NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap('', '<localleader>e', "<Cmd>NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap('', '<localleader>a', "<Cmd>NvimTreeToggle<CR>", {})
vim.api.nvim_set_keymap('', '<c-b>', ":bd<CR>", { })
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

lvim.keys.normal_mode["wg"]  = '<cmd>call utils#toggle_background()<CR>'


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

    nnoremap [Window]g '<cmd>call utils#toggle_background()<CR>'

		nnoremap <silent> [Window]n  :tabnext<CR>
		nnoremap <silent> [Window]p  :tabprev<CR>
]])

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

lvim.keys.normal_mode["<leader>cw"] = "<cmd>keeppatterns %substitute/\\s\\+$//e<CR>"
-- nnoremap <Leader>cw
-- vim.api.nvim_set_keymap('n', '<c-c>', "<cmd>BufferClose!<CR>", {})


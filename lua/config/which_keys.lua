
lvim.builtin.which_key.mappings["c"] = {}
lvim.builtin.which_key.mappings["w"] = {}
lvim.keys.normal_mode["y"] = false
lvim.keys.normal_mode["<s-x>"] = false


lvim.builtin.which_key.mappings["c"] = {name = "Utils", w = {"<cmd>keeppatterns %substitute/\\s\\+$//e<CR>", "Whitespce remove"} }


local opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  -- prefix = "<leader>",
  prefix = "",
  -- buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  -- silent = true, -- use `silent` when creating keymaps
  -- noremap = true, -- use `noremap` when creating keymaps
  -- nowait = false, -- use `nowait` when creating keymaps
}
local mappings = {
  m = {
    name = "Window", -- optional group name
    g = { '<cmd>call utils#toggle_background()<CR>', "Toggle background color" }, -- create a binding with label
    b = { '<cmd>buffer#<CR>', "Buffer alternate"},
    c = { '<cmd>close<CR>', "Close"},
    d = { '<cmd>bdelete<CR>', "Buffer delete"},
    o = { '<cmd>only<CR>', "Only this"},
    q = { '<cmd>quit<CR>', "Quit"},
    x = { '<cmd>call utils#window_empty_buffer()<CR>', "Buffer empty"},
    z = { '<cmd>call utils#zoom()<CR>', "Zoom"},
    -- h = { '<cmd>split<CR>', "Split horizontal"},
    -- v = { '<cmd>vsplit<CR>', "Split vertical"},
    --Split current buffer, go to previous window and previous buffer
    h = { '<cmd>split<CR>:wincmd p<CR>:e#<CR>', "Split horizontal"},
    v = { '<cmd>vsplit<CR>:wincmd p<CR>:e#<CR>', "Split vertical"},
    t = { '<cmd>tabnew<CR>', "Tab new"},
    n = { '<cmd>tabnext<CR>', "Tab next"},
    p = { '<cmd>tabprev<CR>', "Tab previous"},
  }
}

local whkOn, whk = pcall(require, "which-key")
if not whkOn then
  print("Warning: which-keys not loaded for own pre-commands")

  vim.api.nvim_set_keymap('', '<localleader>a', "<Cmd>NvimTreeToggle<CR>", {})
  vim.api.nvim_set_keymap('', '<localleader>e', "<Cmd>NvimTreeToggle<CR>", {})
  vim.api.nvim_set_keymap('', '<c-b>', ":bd<CR>", { })

  vim.cmd([[
      " nnoremap  [Window]   <Nop>
      " nmap      w [Window]
      " nnoremap [Window]b  <cmd>buffer#<CR>

      nnoremap wb  <cmd>buffer#<CR>
      nnoremap wc  <cmd>close<CR>
      nnoremap wd  <cmd>bdelete<CR>
      nnoremap wo  <cmd>only<CR>
      nnoremap wq  <cmd>quit<CR>
      nnoremap wx  <cmd>call utils#window_empty_buffer()<CR>
      nnoremap wz  <cmd>call utils#zoom()<CR>

      " nnoremap wh  <cmd>split<CR>
      " nnoremap wv  <cmd>vsplit<CR>
      " Split current buffer, go to previous window and previous buffer
      nnoremap wh <cmd>split<CR>:wincmd p<CR>:e#<CR>
      nnoremap wv <cmd>vsplit<CR>:wincmd p<CR>:e#<CR>
      nnoremap wg '<cmd>call utils#toggle_background()<CR>'

      nnoremap wt  <cmd>tabnew<CR>
      nnoremap <silent> wn  :tabnext<CR>
      nnoremap <silent> wp  :tabprev<CR>
  ]])
else
  whk.register(mappings, opts)

  whk.register({
      a = { "<Cmd>NvimTreeToggle<CR>", {"Nvimtree toggle"}},
      e = { "<Cmd>NvimTreeToggle<CR>", {"Nvimtree toggle"}},
  }, { prefix = "<localleader>", mode="n" })
end


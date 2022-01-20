
require'telescope'.extensions.dap.commands{}
require'telescope'.extensions.dap.configurations{}
require'telescope'.extensions.dap.list_breakpoints{}
require'telescope'.extensions.dap.variables{}

-- lvim.keys.normal_mode["<leader>h"] = ':set hls! <cr>'
-- " hit '/' highlights then enter search mode

vim.api.nvim_set_keymap("n", "<localleader>dc", "Telescope dap commands<cr>", {noremap=false})
lvim.keys.normal_mode["<localleader>do"] = "Telescope dap configurations<cr>" -- o or g
vim.api.nvim_set_keymap("n", "<localleader>db", "Telescope dap list_breakpoints<cr>", {noremap=false})
vim.api.nvim_set_keymap("n", "<localleader>dv", "Telescope dap variables<cr>", {noremap=false})
vim.api.nvim_set_keymap("n", "<localleader>df", "Telescope dap frames<cr>", {noremap=false})
print('loaded')

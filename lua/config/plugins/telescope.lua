
-- close telescope with q
vim.cmd('au! Filetype TelescopePrompt nmap q <esc>')
vim.cmd('command! Zoxide lua require"plugins.telescope".pickers.zoxide()')



" Mappings
map <silent><leader>id :execute('e ' . g:dir_onedrive . '00_Private/Notes/id.txt')<cr>


" Commpands
command! HelpVim :execute('e ' . g:dir_onedrive . 'VimWiki/VimCommands_learning_Vi_Vim.wiki')
command! InstUbuntu :execute('e ' . g:dir_onedrive . 'ActiveHome/Linux/install/B_my_ubuntu_install_2018.sh')
command! Inst :execute('e ' . g:dir_onedrive . 'ActiveHome/Linux/install/A_linux_mint_install_2019.sh')

command! Bash :execute('e ' . g:dir_onedrive . 'SoftwareTools/Linux/Shell/bash_summary.sh')
command! TBash :execute('e ' . g:dir_onedrive . 'SoftwareTools/Linux/Shell/bash_summary.sh')
command! Plugins :e /home/dave/.config/nvim/config/plugins.yaml

command! Cd2Pkd :execute('cd ' . g:dir_dbox . 'PKD')
command! Cd2Nvim :cd ~/.config/nvim
command! Cd2D :execute('cd ' . g:dir_onedrive . '03_Coding/D')
command! Cd2Python :execute('cd ' . g:dir_onedrive . '03_Coding/Python')


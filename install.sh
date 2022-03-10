
# -- General --
sudo apt -y install npm
sudo apt-get install xclip

# -- Markdown --
sudo npm install -g markdownlint-cli  # vale replacement
sudo cargo install prosemd-lsp   # or download from https://github.com/kitten/prosemd-lsp/releases
# echo 'export PATH="/home/dave/.cargo/bin:$PATH"' >> ~/.zshrc
# echo 'export PATH="/home/dave/.cargo/bin:$PATH"' >> ~/.bashrc


#  -- Python --
sudo pip install pyright pylsp

python3 -m pip install pyright pyls
sudo python3 -m pip install pyright pyls

# -- Lazy git --
sudo add-apt-repository ppa:lazygit-team/release
sudo apt-get update
sudo apt-get install lazygit

# -- Zoxide --

# sudo apt install zoxide  # Ubuntu >21.04
curl -sS https://webinstall.dev/zoxide | bash


# =======================================================

# brew install luarocks
# luarocks install luacheck  # if you want to use luacheck
cargo install selene  # if you want to use selene instead of luacheck
# brew install hadolint  # if you want to lint dockerfiles
pip install vim-vint  # for vim linting
# install llvm and clang_format for clang stuff
npm install -g @fsouza/prettierd # if you want to use prettierd
pip install yapf flake8 black  # for python stuff
# if you want to use the markdown thingy
# brew install vale markdownlint-cli
# cp -r ~/.config/lvim/.vale ~/.config/vale
# fix the address inside .vale.ini
# cp ~/.config/lvim/vale_config.ini ~/.vale.ini
# if you want the latex stuff
# brew install --cask mactex-no-gui # for mac
# or install zathura and chktex on linux
`

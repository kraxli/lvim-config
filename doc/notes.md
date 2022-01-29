
# Where to find what

packer plugins directory: `/home/dave/.local/share/lunarvim/site/pack/packer`

```sh
#Set branch to master unless specified by the user
declare LV_BRANCH="${LV_BRANCH:-"master"}"
declare -r LV_REMOTE="${LV_REMOTE:-lunarvim/lunarvim.git}"
declare -r INSTALL_PREFIX="${INSTALL_PREFIX:-"$HOME/.local"}"

declare -r XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -r XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"

declare -r LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$XDG_DATA_HOME/lunarvim"}"
declare -r LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$XDG_CONFIG_HOME/lvim"}"
declare -r LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$LUNARVIM_RUNTIME_DIR/lvim"}"
```


# lvim-config

Kraxli's LunarVim Config

# Examples

See [LunarVim FAQ](https://www.lunarvim.org/community/faq.html#what-is-null-ls-and-why-do-you-use-it)

Where can I find some example configs?

If you want ideas for configuring LunarVim you can look at these repositories.

- Chris - https://github.com/ChristianChiarulli/lvim
- Abouzar - https://github.com/abzcoding/lvim

# Plugins

`rcarriga/nvim-notify`: A fancy, configurable, notification manager for NeoVim (messages, error, popup)

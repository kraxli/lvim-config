-- Neovim
-- =========================================
lvim.format_on_save = false
lvim.leader = " "
vim.g.maplocalleader = ','
lvim.colorscheme = "one-nvim" -- "tokyonight" -- "one-nvim" -- "pablo"
vim.o.background = 'light'
lvim.debug = false
vim.lsp.set_log_level "warn"
lvim.log.level = "warn"
-- vim.o.conceallevel = 2 -- uncomment if you want to see concealed text
require("user.neovim").config()

-- Customization
-- =========================================
lvim.builtin.sell_your_soul_to_devil = { active = false, prada = false } -- if you want microsoft to abuse your soul
lvim.builtin.lastplace = { active = false } -- change to false if you are jumping to future
lvim.builtin.tabnine = { active = true } -- change to false if you don't like tabnine
lvim.builtin.persistence = { active = true } -- change to false if you don't want persistence
lvim.builtin.presence = { active = false } -- change to true if you want discord presence
lvim.builtin.orgmode = { active = true } -- change to true if you want orgmode.nvim
lvim.builtin.dap.active = true -- change this to enable/disable debugging
lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
<<<<<<< HEAD
lvim.builtin.fancy_wild_menu = { active = false } -- enable/disable use wilder.nvim
lvim.builtin.fancy_rename = { active = true } -- enable/disable custom rename
lvim.builtin.fancy_diff = { active = true } -- enable/disable fancier git diff
=======
lvim.builtin.fancy_wild_menu = { active = false } -- enable/disable cmp-cmdline
lvim.builtin.fancy_diff = { active = false } -- enable/disable fancier git diff
>>>>>>> abzcoding/lvim/main
lvim.builtin.lua_dev = { active = true } -- change this to enable/disable folke/lua_dev
lvim.builtin.test_runner = { active = true } -- change this to enable/disable vim-test, ultest
lvim.builtin.cheat = { active = true } -- enable cheat.sh integration
lvim.builtin.sql_integration = { active = false } -- use sql integration
lvim.builtin.smooth_scroll = "cinnamon" -- for smoth scrolling, can be "cinnamon", "neoscroll" or ""
lvim.builtin.neoclip = { active = true, enable_persistent_history = false }
lvim.builtin.nonumber_unfocus = false -- diffrentiate between focused and non focused windows
lvim.builtin.harpoon = { active = true } -- use the harpoon plugin
lvim.builtin.remote_dev = { active = false } -- enable/disable remote development
lvim.builtin.cursorline = { active = false } -- use a bit fancier cursorline
lvim.builtin.motion_provider = "hop" -- change this to use different motion providers ( hop or lightspeed )
lvim.builtin.hlslens = { active = false } -- enable/disable hlslens
lvim.builtin.csv_support = true -- enable/disable csv support
lvim.builtin.sidebar = { active = false } -- enable/disable sidebar
lvim.builtin.async_tasks = { active = true } -- enable/disable async tasks
lvim.builtin.metals = {
  active = false, -- enable/disable nvim-metals for scala development
  fallbackScalaVersion = "2.13.7",
  serverVersion = "0.10.9+271-a8bb69f6-SNAPSHOT",
}
lvim.builtin.collaborative_editing = { active = false } -- enable/disable collaborative editing
lvim.lsp.document_highlight = true
lvim.builtin.file_browser = { active = false } -- enable/disable telescope file browser
lvim.builtin.sniprun = { active = false } -- enable/disable sniprun
lvim.builtin.tag_provider = "symbols-outline" -- change this to use different tag providers ( symbols-outline or vista )
lvim.builtin.editorconfig = { active = true } -- enable/disable editorconfig
<<<<<<< HEAD
lvim.builtin.fancy_telescope = { active = false } -- telescope to the moon
=======
>>>>>>> abzcoding/lvim/main
lvim.builtin.global_statusline = false -- set true to use global statusline
lvim.builtin.dressing = { active = false } -- enable to override vim.ui.input and vim.ui.select with telescope
lvim.builtin.refactoring = { active = false } -- enable to use refactoring.nvim code_actions

local user = os.getenv "USER"
<<<<<<< HEAD
if user and (user == "dave" or user == "s6s94k") then  -- abz
  lvim.builtin.nvim_web_devicons = { active = true }
  lvim.builtin.sell_your_soul_to_devil = false -- true
  lvim.lsp.document_highlight = true
=======
if user and user == "abz" then
  lvim.builtin.nvim_web_devicons = { active = false }
  lvim.builtin.sell_your_soul_to_devil = { active = true, prada = false }
  lvim.lsp.document_highlight = false
>>>>>>> abzcoding/lvim/main
  lvim.builtin.csv_support = true
  lvim.builtin.async_tasks.active = true
  lvim.builtin.dap.active = true
  lvim.builtin.sql_integration.active = true
  vim.g.instant_username = user
  lvim.builtin.collaborative_editing.active = true
  lvim.builtin.file_browser.active = true
  lvim.builtin.global_statusline = true
  lvim.builtin.dressing.active = true
  lvim.builtin.fancy_wild_menu.active = true
  lvim.builtin.refactoring.active = true
  require("user.prose").config() -- setup prosemd-lsp for my local use
end
lvim.lsp.diagnostics.virtual_text = false -- remove this line if you want to see inline errors
lvim.builtin.latex = {
  view_method = "skim", -- change to zathura if you are on linux
  preview_exec = "/Applications/Skim.app/Contents/SharedSupport/displayline", -- change this to zathura as well
  rtl_support = true, -- if you want to use xelatex, it's a bit slower but works very well for RTL langs
}
lvim.builtin.notify.active = true
lvim.lsp.automatic_servers_installation = true -- false
if lvim.builtin.cursorline.active then
  lvim.lsp.document_highlight = false
end
lvim.lsp.code_lens_refresh = true
require("user.builtin").config()

-- StatusLine
-- =========================================
if lvim.builtin.fancy_statusline.active then
  require("user.lualine").config()
end

-- Debugging
-- =========================================
if lvim.builtin.dap.active then
  require("user.dap").config()
end

-- Language Specific
-- =========================================
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, {
  "clangd",
  "dockerls",
  "gopls",
  "jdtls",
  "pyright",
  "r_language_server",
  "rust_analyzer",
  "sumneko_lua",
  "taplo",
  "texlab",
  "tsserver",
  "yamlls",
})
require("user.null_ls").config()

-- Additional Plugins
-- =========================================
require("user.plugins").config()

-- Autocommands
-- =========================================
require("user.autocommands").config()

-- Additional keybindings
-- =========================================
require("user.keybindings").config()

-- =======================================================
-- Additional settings (kraxli)
-- =======================================================
require("config.general")
-- TODO: move from vim to lua
vim.cmd([[
  let g:local_source_dir = fnamemodify(expand('<sfile>'), ':h').'/local/'
  if filereadable(g:local_source_dir . 'init.vim')
    execute 'source ' . g:local_source_dir . 'init.vim'
  endif
]])


-- load install file(s)
require("install.plugins")

-- load specific configurations
-- -------------------------------------------------------
require("config.commands")
-- require("config.mappings").unmapKeys()
-- require("config.mappings").generalVimKeys()
-- require("config.commands").telescope()
require("config.keybindings").unmapKeys()
require("config.keybindings").generalVimKeys()
require("config.keybindings").telescope()
vim.cmd('au! FileType markdown,vimwiki,text lua require("config.keybindings").bulletsVim()')
-- vim.cmd([[au! BufEnter * lua require("config.which-keys")]])
vim.cmd([[au! BufWinEnter * lua require("config.which-keys")]])

require("config.plugins.nvimtree")
require("config.plugins.telescope")
require("config.plugins.devicons")
require("config.plugins.lsp")
require("config.plugins.dap")
require("config.plugins.trouble")

-- require("plugins.vimwiki")


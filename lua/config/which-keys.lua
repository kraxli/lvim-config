
lvim.builtin.which_key.mappings["c"] = {}
lvim.builtin.which_key.mappings["w"] = {}

lvim.builtin.which_key.mappings["c"] = {name = "Utils", w = {"<cmd>keeppatterns %substitute/\\s\\+$//e<CR>", "Whitespce remove"} }

local optsNormLocLeader = {mode = "n", prefix = "<localleader>"}
local optsNormNoPrefix = {mode = "n", prefix = ""}
local optsXmodeLocLeader = {mode = "x", prefix = "<localleader>"}

local mapsNormNoPrefix = {
  m = {
    name = "Window", -- optional group name
    g = { '<cmd>call utils#toggle_background()<CR>', "Toggle background color" }, -- create a binding with label
    b = { '<cmd>buffer#<CR>', "Buffer alternate"},
    o = { '<cmd>only<CR>', "Only this"},
    c = { '<cmd>close<CR>', "Close"},
    d = { '<cmd>bdelete<CR>', "Buffer delete"},
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

    f = { '<cmd>lcd %:p:h<CR>'},
  },

   -- Telescope LSP related
  l = {
    name = "Lsp",
    d = {'<cmd>Telescope lsp_definitions<CR>', "Lsp definitions"},
    i = {'<cmd>Telescope lsp_implementations<CR>', "Lsp implementations"},
    r = {'<cmd>Telescope lsp_references<CR>', "Lsp references"},
    a = {'<cmd>Telescope lsp_code_actions<CR>', "Lsp code actions"},
    c = {'<cmd>Telescope lsp_range_code_actions<CR>', "Lsp range code actions"},
    v = {"<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vsplit"},
  },
}

local mapsNormLocLeader = {

    -- Telescope general pickers
    b = {'<cmd>Telescope buffers<CR>', "Buffers"},
    f = {'<cmd>Telescope find_files<CR>', "Files"},
    g = {'<cmd>Telescope live_grep<CR>', "Live grep"},
    G = {"<cmd>lua require('plugins.telescope').pickers.grep_string_cursor()<cr>", "Grep cursor word"},
    h = {'<cmd>Telescope highlights<CR>', "Highlights"},
    H = {'<cmd>Telescope search_history<CR>', "Search history"},
    j = {'<cmd>Telescope jumplist<CR>', "Jumplist"},
    m = {'<cmd>Telescope marks<CR>', "Marks"},
    p = {'<cmd>Telescope projects<CR>', "Projects"},
    o = {'<cmd>Telescope vim_options<CR>', "Vim options"},
    r = {'<cmd>Telescope resume<CR>', "Resume last"},
    R = {'<cmd>Telescope pickers<CR>', "Pickers"},
    S = {'<cmd>Telescope session-lens search_session<CR>', "Search session"},
    s = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "Search current Buffer" },
    ["/"] = { '<cmd>Telescope current_buffer_fuzzy_find<CR>', "Search current buffer"},
    t = {'<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', "LSP workspace symbols"},
    u = {'<cmd>Telescope spell_suggest<CR>', "Spell suggestions"},
    v = {'<cmd>Telescope registers<CR>', "Registers"},
    x = {'<cmd>Telescope oldfiles<CR>', "Files old"},
    z = {'<cmd>Zoxide<CR>', "Zoxide"},
    c = { '<cmd>Telescope command_history<CR>', "Command history"}, -- ;
    n = { '<cmd>lua require"config.plugins.telescope".pickers.plugin_directories()<CR>', "Directories"},
    w = { '<cmd>lua require"config.plugins.telescope".pickers.notebook()<CR>', "Notebook"},

    -- Nvimtree
    a = { "<Cmd>NvimTreeToggle<CR>", "Nvimtree toggle"},
    e = { "<Cmd>NvimTreeToggle<CR>", "Nvimtree toggle"},
}


local mapsXmodeLocLeader = {

  -- Telescope
  g = {'<cmd>lua require"config.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection"},
  G = {'<cmd>lua require"config.plugins.telescope".pickers.grep_string_visual()<cr>', "Grep selection"},
}


local whkOn, whk = pcall(require, "which-key")
if not whkOn then
  print("Warning: lua/config/which-keys not loaded")

  require("config.no_which-key").viewKeys()
  require("config.no_which-key").telescope()
  require("config.no_which-key").nerdtree()

else
  whk.register(mapsNormNoPrefix, optsNormNoPrefix)
  whk.register(mapsNormLocLeader, optsNormLocLeader)
  whk.register(mapsXmodeLocLeader, optsXmodeLocLeader)
end

-------------------------------------------------------
-- LSP --
-------------------------------------------------------

-- require("which-key").register { ["<leader>gd"] = "diffview: diff HEAD" }
lvim.builtin.which_key.mappings['gd'] = {"<cmd>diffview: diff HEAD" }

-------------------------------------------------------
-- LSP --
-------------------------------------------------------

-- Telescope Lsp
lvim.builtin.which_key.mappings['lA'] = {'<cmd>Telescope lsp_range_code_actions<CR>', "Lsp range code actions"}
lvim.builtin.which_key.mappings['lD'] = {'<cmd>Telescope lsp_definitions<CR>', "Lsp definitions"}
lvim.builtin.which_key.mappings['lI'] = {'<cmd>Telescope lsp_implementations<CR>', "Lsp implementations"}
lvim.builtin.which_key.mappings['lz'] = {'<cmd>Telescope lsp_references<CR>', "Lsp references"}
lvim.builtin.which_key.mappings['lR'] = {'<cmd>Telescope lsp_references<CR>', "Lsp references"}
-- a = {'<cmd>Telescope lsp_code_actions<CR>', "Lsp code actions"},

-- Other Lsp
lvim.builtin.which_key.mappings['lv'] = {"<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition vsplit"}


-------------------------------------------------------
-- GIT --
-------------------------------------------------------

-- Neogit --
lvim.builtin.which_key.mappings["gm"] = {"<cmd>Neogit<CR>", "Magit" }  -- noremap=true
lvim.builtin.which_key.mappings["gy"] = {"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>", 'Lazygit'}
lvim.builtin.which_key.mappings["gg"] = {"<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd = 'lazygit', count = 1, direction = 'float'})<CR>", 'Lazygit'}


-------------------------------------------------------
-- Trouble --
-------------------------------------------------------

lvim.builtin.which_key.mappings["T"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "Trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Location list" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
  -- definition
  -- ....
}

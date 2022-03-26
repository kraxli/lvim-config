local plugins = {

  ------------------------------------------------------------------
  -- General Keys
  ------------------------------------------------------------------
  {
    "romainl/vim-cool", -- disables search highlighting when you are done
    event = { "CursorMoved", "InsertEnter" },
  },

  -- {
  --   "lambdalisue/nerdfont.vim",  -- lazy by nature
  -- },

  {
    'machakann/vim-sandwich',
    keys = {'s'},
    event = "BufReadPost",
    config = function()
      require('config.plugins.sandwich')
    end,
  },
  -- alternative: machakann/vim-sandwich
  {
    'appelgriebsch/surround.nvim',
    disable = 1,
    keys = {'s'},
    event = "BufReadPost",
    config = function()
      require('config.plugins.surround-nvim')
    end,
  },

  -- {
  --   "lambdalisue/nerdfont.vim",  -- lazy by nature
  -- },
  -------------------------------------------------------
  -- GIT --
  -------------------------------------------------------
  {
    "TimUntersberger/neogit",
    requires = {'nvim-lua/plenary.nvim', 'diffview.nvim'},
    cmd = 'Neogit',
    config = function ()
      require('config.plugins.neogit')
    end
  },

  {
    'chentau/marks.nvim',
    requires = "gitsigns.nvim",
    event = "FileType",
    config = function ()
      require('config.plugins.marks')
    end
  },

  ------------------------------------------------------------------
  -- Telescope
  ------------------------------------------------------------------
  -- switch between projects
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },

  ------------------------------------------------------------------
  -- LSP / DAP
  ------------------------------------------------------------------
  -- {
  --     "ray-x/lsp_signature.nvim",
  --     config = function() require"lsp_signature".on_attach({toggle_key = '<M-a>', hi_parameter = "LspSignatureActiveParameter"}) end,
  --     event = "BufRead", -- for setup
  -- },

  -- R support
  {"jalvesaq/Nvim-R"},
  -------------------------------------------------------
  -- LSP --
  -------------------------------------------------------
    -- cwd to the project's root directory
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },

  -- lua in Neovim debug support
  {
    "jbyuki/one-small-step-for-vimkind",
    ft = { "lua" },
    -- setup = function() require("config.plugins.dap") end,
  },

  ------------------------------------------------------------------
  -- notetaking, wiki, markdonw, tex
  ------------------------------------------------------------------
  {
    'renerocksai/calendar-vim',
  },

  {
    'godlygeek/tabular',
    ft = {'markdown', 'vimwiki'},
  },

  {
    'preservim/vim-markdown',
    ft = {'markdown', 'vimwiki'},
    config = function()
      require("config.plugins.vim-markdown")
    end,
  },

  {
    'dkarter/bullets.vim',
    ft = {'markdown', 'vimwiki'},
    cmd = {'ToggleCheckbox'},
    setup = function()
      require("config.plugins.bullets").setup()
    end,
  },

  -- TODO:
  {
    "renerocksai/telekasten.nvim",
    ft = {'markdown', 'vimwiki', 'text'},
    cmd = {'Telekasten', 'Tk'},
    keys = {'<leader>z'},
    setup = function ()
      vim.cmd([[
        command! Tk :Telekasten
      ]])
      require("config/plugins/telekasten")
    end,
  },

  -- telescope-symbols.nvim
  -- vim-markdown-toc
  -- telescope-media-files


  -------------------------------------------------------
  -- colors
	{
    "Th3Whit3Wolf/one-nvim",
    -- config = function()
    --   vim.cmd [[colorscheme one-nvim]]
    -- end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return (_time.hour >= 22 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1)
    -- end,
  },

    -- cond = function()
    --   -- require("user.theme").doom()
    --   vim.cmd [[colorscheme one-nvim]]
    -- end,
    -- cond = function()
    --   local _time = os.date "*t"
    --   return (_time.hour >= 17 and _time.hour < 21)
    -- end,

   -- {"Th3Whit3Wolf/space-nvim"},
   -- {"Th3Whit3Wolf/onebuddy"},
   -- {"Mofiqul/vscode.nvim"},
   -- {"rafamadriz/neon"},
}


-- table.merge(lvim.plugins, plugins)
-- lvim.plugins = table.combine(lvim.plugins, plugins)
for _, v in ipairs(plugins) do
   table.insert(lvim.plugins, v)
end


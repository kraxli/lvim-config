local plugins = {

  -------------------------------------------------------
  -- General
  -------------------------------------------------------
  {
    {'chentau/marks.nvim'},
    requires = "gitsigns.nvim",
    event = "FileType",
    config = function ()
      require('config.plugins.marks')
    end
  },

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

  -------------------------------------------------------
  -- Telescope --
  -------------------------------------------------------
  -- switch between projects
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },

  { 
    "jvgrootveld/telescope-zoxide",
    setup = function()
      require('confgi.plugins.telescope-zoxide')
    end
  },

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

  -- R support
  {"jalvesaq/Nvim-R"},

  -- lua in Neovim debug support
  {
    "jbyuki/one-small-step-for-vimkind",
    ft = { "lua" },
    -- setup = function() require("config.plugins.dap") end,
  },

  -------------------------------------------------------
  -- Markdown, Wiki, Notes, Tex, Tasks managment,
  -- Calendar, ...
  -------------------------------------------------------

  {
    'godlygeek/tabular',
    ft = {'markdown', 'vimwiki'}
  },  

  -- {
  --   'preservim/vim-markdown',
  --   ft = {'markdown', 'vimwiki'}
  -- },

  -- TODO:
  {
    "renerocksai/telekasten.nvim",
  },

  -- telescope-symbols.nvim
  -- vim-markdown-toc
  -- telescope-media-files


  -- notetaking, wiki, markdonw, tex
  {
    'renerocksai/calendar-vim',
  },


  -------------------------------------------------------
  -- colors
  -------------------------------------------------------
	{
    "Th3Whit3Wolf/one-nvim",
    config = function()
      -- require("user.theme").kanagawa()
      vim.cmd [[colorscheme one-nvim]]
    end,
    cond = function()
      local _time = os.date "*t"
      return (_time.hour >= 22 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1)
    end,


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


local plugins = {

  -------------------------------------------------------
  -- General
  -------------------------------------------------------
  {
    'chentau/marks.nvim',
    requires = "gitsigns.nvim",
    event = "FileType",
    config = function ()
      require('config.plugins.marks')
    end
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
    keys = {'s'},
    event = "BufReadPost",
    config = function()
      require('config.plugins.surround-nvim')
    end,
    disable = 1,
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

  -- {
  --   "jvgrootveld/telescope-zoxide",
  --   setup = function()
  --     require('confgi.plugins.telescope-zoxide')
  --   end
  -- },

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

  -------------------------------------------------------
  -- Markdown, Wiki, Notes, Tex, Tasks managment,
  -- Calendar, ...
  -------------------------------------------------------

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
    ft = {'markdown', 'vimwiki', 'text'},
    cmd = {'ToggleCheckbox'},
    setup = function()
      require("config.plugins.bullets").setup()
    end,
  },

  -- TODO:
  {
    "renerocksai/telekasten.nvim",
    -- ft = {'markdown', 'vimwiki', 'text'},
    -- cmd = {'Telekasten', 'Tk'},
    -- keys = {'<leader>z'},
    event = "BufWinEnter",
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

  -- notetaking, wiki, markdonw, tex
  {
    'renerocksai/calendar-vim',
  },

  -------------------------------------------------------
  -- colors
  -------------------------------------------------------

  -- lazy by nature
	{
    "Th3Whit3Wolf/one-nvim",
  },

   -- {"Th3Whit3Wolf/space-nvim"},
   -- {"Th3Whit3Wolf/onebuddy"},
   -- {"Mofiqul/vscode.nvim"},
   -- {"rafamadriz/neon"},
}


  -------------------------------------------------------
  -- append plugins-table to lvim.plugins
  -------------------------------------------------------

-- table.merge(lvim.plugins, plugins)
-- lvim.plugins = table.combine(lvim.plugins, plugins)
for _, v in ipairs(plugins) do
   table.insert(lvim.plugins, v)
end


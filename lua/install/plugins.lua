
require("config.plugins.dap")

-- Additional Plugins
lvim.plugins = {
    -- {
    --   "Pocco81/DAPInstall.nvim",
    --   commit = commit.dap_install,
    --   -- event = "BufWinEnter",
    --   -- event = "BufRead",
    --   disable = not lvim.builtin.dap.active,
    -- },

    {"folke/tokyonight.nvim"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },

    
    -- {"rakr/vim-one"},
    {
      -- css, html, ... 
      "turbio/bracey.vim",
      cmd = {"Bracey", "BracyStop", "BraceyReload", "BraceyEval"},
      run = "npm install --prefix server",
    },
    { "tpope/vim-repeat" },
    -- {
    --   "tpope/vim-surround",
    --   keys = {"sc", "sd", "sa"},
    -- },
 
    {
     'machakann/vim-sandwich',
      keys = { '<Plug>(operator-sandwich-', '<Plug>(textobj-sandwich-' },
      setup = function() -- setup: load stuff before the plugin is loaded
        vim.g.sandwich_no_default_key_mappings = 1
        vim.g.operator_sandwich_no_default_key_mappings = 1
        vim.g.textobj_sandwich_no_default_key_mappings = 1
      end,
      config = function() -- config: load stuff after the plugin is loaded
        vim.cmd([[
            lvim.keys.normal_mode["sa"] =  <Plug>(operator-sandwich-add)
            " nmap <silent> sa <Plug>(operator-sandwich-add)
            xmap <silent> sa <Plug>(operator-sandwich-add)
            omap <silent> sa <Plug>(operator-sandwich-g@)
            nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
            xmap <silent> sd <Plug>(operator-sandwich-delete)
            nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
            xmap <silent> sr <Plug>(operator-sandwich-replace)
            nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
            nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
            omap ir <Plug>(textobj-sandwich-auto-i)
            xmap ir <Plug>(textobj-sandwich-auto-i)
            omap ab <Plug>(textobj-sandwich-auto-a)
            xmap ab <Plug>(textobj-sandwich-auto-a)
            omap is <Plug>(textobj-sandwich-query-i)
            xmap is <Plug>(textobj-sandwich-query-i)
            omap as <Plug>(textobj-sandwich-query-a)
            xmap as <Plug>(textobj-sandwich-query-a)
      ]])
      end
    },
    {
      "felipec/vim-sanegx",
      event = "BufRead",
    },
    {
      "itchyny/vim-cursorword",
        event = {"BufEnter", "BufNewFile"},
        config = function()
          vim.api.nvim_command("augroup user_plugin_cursorword")
          vim.api.nvim_command("autocmd!")
          vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
          vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
          vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
          vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
          vim.api.nvim_command("augroup END")
          end
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
    -- smooth scrolling
    {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
      require('neoscroll').setup({
            -- All these keys will be mapped to their corresponding default scrolling animation
            mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
            hide_cursor = true,          -- Hide cursor while scrolling
            stop_eof = true,             -- Stop at <EOF> when scrolling downwards
            use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
            respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
            cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
            easing_function = nil,        -- Default easing function
            pre_hook = nil,              -- Function to run before the scrolling animation starts
            post_hook = nil,              -- Function to run after the scrolling animation ends
            })
      end
    },
    -- indentation guides for every line
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard"}
        vim.g.indent_blankline_buftype_exclude = {"terminal"}
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
      end
    },

    -- autosave
    {
      "Pocco81/AutoSave.nvim",
      config = function()
        require("autosave").setup()
      end,
    },

    -- cwd to the project's root directory
    {
      "ahmedkhalf/lsp-rooter.nvim",
      event = "BufRead",
      config = function()
        require("lsp-rooter").setup()
      end,
    },

    -- color highlighter
    -- {
    --   "norcalli/nvim-colorizer.lua",
    --     config = function()
    --       require("colorizer").setup({ "*" }, {
    --           RGB = true, -- #RGB hex codes
    --           RRGGBB = true, -- #RRGGBB hex codes
    --           RRGGBBAA = true, -- #RRGGBBAA hex codes
    --           rgb_fn = true, -- CSS rgb() and rgba() functions
    --           hsl_fn = true, -- CSS hsl() and hsla() functions
    --           css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    --           css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
    --           })
    --   end,
    -- },

    -- switch between projects
    {
      "nvim-telescope/telescope-project.nvim",
      event = "BufWinEnter",
      setup = function()
        vim.cmd [[packadd telescope.nvim]]
      end,
    },

    -- fzy style sorter that is compiled
    -- {
    --   "nvim-telescope/telescope-fzy-native.nvim",
    --   run = "make",
    --   event = "BufRead",
    -- },

    -------------------------------------------------------------------------------
    -- CODING
    -------------------------------------------------------------------------------
    {
      "rcarriga/nvim-dap-ui",
      -- after = {"nvim-dap"},
      cmd = "lua dapui",
      requires = {"mfussenegger/nvim-dap"},  -- , opt = true
      config = function()
        requires("config/plugins/dap-ui")
      end
    },

    {"nvim-telescope/telescope-dap.nvim"},

    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },

    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end
    },
    
    -- autoclose and autorename html tag
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup()
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

    -- python
    -- {"mfussenegger/nvim-dap-python"},

    -------------------------------------------------------------------------------
    -- GIT
    -------------------------------------------------------------------------------

    -- git diff in a single tabpage
    {
      "sindrets/diffview.nvim",
      event = "BufRead",
    },

    -- git blame
    {
      "f-person/git-blame.nvim",
      event = "BufRead",
      config = function()
        vim.cmd "highlight default link gitblame SpecialComment"
        vim.g.gitblame_enabled = 0
      end,
    },

    -------------------------------------------------------------------------------
    -- NOTE TAKING / MARKDOWN / LATEX
    -------------------------------------------------------------------------------
    
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      ft = "markdown",
      config = function()
        vim.g.mkdp_auto_start = 1
      end,
    },

    {
      "ekickx/clipboard-image.nvim",
      ft = {"markdown", "text", "vimwiki"},
      cmd = {"PasteImg"},
      config = function()
        require('config.plugins.clipboard-image')
      end
    },

    {
      "kraxli/vimwiki",
      branch = "nvim-compe",
      ft = {"vimwiki", "markdown" },
      -- map = { n: <Plug> },
      cmd = {"VimwikiIndex", "VimwikiUISelect"},
      config = function()
        require('config.plugins.vimwiki')
      end
    },
}

-- if dein#tap('todo-comments.nvim')
-- 	nnoremap <LocalLeader>dt <cmd>TodoTelescope<CR>
-- endif
-- require('todo-comments').setup({
-- 	signs = false,



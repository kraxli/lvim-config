
-- /user/bin/python
local pythonPath = '/home/dave/anaconda3/bin/python'
vim.api.nvim_command("command! LspFormat lua vim.lsp.buf.formatting_sync(nil, 1000)")
-- vim.api.nvim_command("command! -range LspFormat '<,'> lua vim.lsp.buf.range_formatting()")

-- require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
-- require('dap-python').setup('/home/dave/anaconda3/bin/python')

local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  -- command = 'path/to/virtualenvs/debugpy/bin/python';
  command = pythonPath;
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        -- return '/usr/bin/python'
        return pythonPath
      end
    end;
  },
}

local dap_install = require "dap-install"
dap_install.config("python", {})

local opts = {
  root_dir = function(fname)
    local util = require "lspconfig.util"
    local root_files = {
      "pyproject.toml",
      "setup.py",
      "setup.cfg",
      "requirements.txt",
      "Pipfile",
      "manage.py",
      "pyrightconfig.json",
    }
    return util.root_pattern(unpack(root_files))(fname) or util.root_pattern ".git"(fname) or util.path.dirname(fname)
  end,
  settings = {
    pyright = {
      disableLanguageServices = false,
      disableOrganizeImports = false,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
  single_file_support = true,
}

local servers = require "nvim-lsp-installer.servers"
local server_available, requested_server = servers.get_server "pyright"
if server_available then
  opts.cmd_env = requested_server:get_default_options().cmd_env
end

require("lvim.lsp.manager").setup("pyright", opts)

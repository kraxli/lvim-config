

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", args = {"--line-width=100"} },  -- TODO: more options (see nvim-config)
  { exe = "isort", filetypes = { "python" } },
  -- {
  --   exe = "prettier",
  --   args = { "--print-width", "100" },
  --   filetypes = { "typescript", "typescriptreact", "markdown" },
  -- },
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", args = {"--max-line-length=99"} }, -- TODO: more options (see nvim-config)
  -- { exe = "codespell", filetypes = { "python", "javascript" } },
  -- {
  --   exe = "shellcheck",
  --   args = { "--severity", "warning" },
  -- },
}


-- lvim.lsp.diagnostics.underline = false
-- lvim.lsp.diagnostics.underline = true
-- lvim.autocommands.custom_groups = {
--   { "CursorHold", "*", "lua vim.diagnostic.open_float(0,{scope='line'})" },
-- }

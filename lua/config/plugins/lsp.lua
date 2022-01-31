
-- lvim.lsp.diagnostics.underline = false
lvim.lsp.diagnostics.underline = true
lvim.autocommands.custom_groups = {
  { "CursorHold", "*", "lua vim.diagnostic.open_float(0,{scope='line'})" },
}

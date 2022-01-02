
require'nvim-tree'.setup {
  disable_netrw = false,
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    lvim.builtin.nvimtree.setup.view.mappings.list = {
      { key = "h", cb = tree_cb "close_node" },
      { key = "v", cb = tree_cb "vsplit" },
      { key = "V", cb = tree_cb("preview") },
      { key = {"C", "<tab>", "O"}, cb = tree_cb "cd" },
      { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      { key = "<BS>", cb = tree_cb("dir_up") },
      { key = "-", cb = tree_cb("close_node") },
      { key = {"a", "n"}, cb = tree_cb("create") },
      { key = {"x", "xx"}, cb = tree_cb("cut") },
      { key = {"c", "<C-c>", "yy"}, cb = tree_cb("copy") },
      { key = {"p", "<C-p>", "<C-v>"}, cb = tree_cb("paste") },

      { key = "gtf", cb = "<cmd>lua require'lvim.core.nvimtree'.start_telescope('find_files')<cr>" },
      { key = "gtg", cb = "<cmd>lua require'lvim.core.nvimtree'.start_telescope('live_grep')<cr>" },
}


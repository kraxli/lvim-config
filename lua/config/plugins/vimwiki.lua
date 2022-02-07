

vim.cmd("let g:vimwiki_list = [ { 'diary_header': 'Diary', 'diary_link_fmt': '%Y-%m/%d', 'auto_toc': 1, 'path': '~/docs/wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, { 'path': '~/docs/books/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, ]")
-- vim.api.nvim_set_var("vimwiki_list", "[{ 'diary_header': 'Diary', 'diary_link_fmt': '%Y-%m/%d', 'auto_toc': 1, 'path': '~/docs/wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}, { 'path': '~/docs/books/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]")

vim.cmd([[
    let g:vimwiki_conceallevel = 2
    let g:vimwiki_folding = 'custom'
    let g:vimwiki_use_calendar = 1
    let g:vimwiki_hl_headers = 1
    let g:vimwiki_hl_cb_checked = 1
    let g:vimwiki_autowriteall = 0
    let nested_syntax = {'py': 'python', 'sh': 'bash', 'json': 'javascript'}
    let vimwiki_list_zettel = { 'path': exists('g:dir_zettelk') && g:dir_zettelk != '' ? g:dir_zettelk : '~/Dropbox/PKD/', 'ext':'.md', 'syntax':'markdown', 'links_space_char': '-', 'nested_syntaxes': nested_syntax, }
    let g:vimwiki_list = add(g:vimwiki_list, vimwiki_list_zettel)
]])


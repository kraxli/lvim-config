
" setl foldlevel=1
setl foldmethod=expr foldenable
setl foldexpr=markdown#MkdFoldSimple(v:lnum)
setl spell spelllang=en,de

" for more languages see: https://support.codebasehq.com/articles/tips-tricks/syntax-highlighting-in-markdown
let g:vim_markdown_fenced_languages = [
    \ 'bash',
    \ 'sh=bash',
    \ 'cpp',
    \ 'c++=cpp',
    \ 'd',
    \ 'dlang=d',
    \ 'docker=Dockerfile',
    \ 'html',
    \ 'ini=dosini',
    \ 'javascript',
    \ 'js=javascript',
    \ 'json=javascript',
    \ 'jsx=javascriptreact',
    \ 'julia',
    \ 'lua',
    \ 'makefile=make',
    \ 'python',
    \ 'py=python',
    \ 'ruby',
    \ 'tsx=typescriptreact',
    \ 'vim',
    \ 'viml=vim',
    \ ]

" let g:vim_markdown_frontmatter = 1
" let g:vim_markdown_strikethrough = 1
" let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 1
" let g:vim_markdown_conceal_code_blocks = 1
" let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_toc_autofit = 0
" let g:vim_markdown_follow_anchor = 0
" let g:vim_markdown_no_extensions_in_markdown = 1
" let g:vim_markdown_edit_url_in = 'vsplit'

augroup mkdGroup " {{{
	autocmd!

	autocmd FileType markdown let b:sleuth_automatic = 0

augroup END



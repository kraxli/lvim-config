
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

let b:sleuth_automatic = 0
" augroup mkdGroup " {{{
" 	autocmd!
" 
" 	autocmd FileType markdown let b:sleuth_automatic = 0
" 
" augroup END




"""""""""""""""
" colors
"""""""""""""""

" ----------
" functions:
" ----------

if v:version < 508
  command! -nargs=+ HiLink hi link <args>
else
  command! -nargs=+ HiLink hi def link <args>
endif


" -------------------------
" links patterns to colors:
" -------------------------

HiLink tklink       htmlLink
HiLink tkBrackets   Delimiter
HiLink tkHighlight  htmlString
HiLink tkTagSep     Identifier
HiLink tkTag        Identifier

" hi tkLink ctermfg=Blue cterm=bold,underline guifg=blue gui=bold,underline
" hi tkBrackets ctermfg=gray guifg=gray

delcommand HiLink



" plugin for markdown-folding and more

function! markdown#MkdFoldSimple(lnum)

  " let cur_line = getline(a:lnum)
  " let nxt_line = getline(a:lnum + 1)
  " let prv_line =  getline(a:lnum - 1)

  " let prv_syntax_group = synIDattr(synID(a:lnum - 1, 1, 1), 'name')
  let cur_syntax_group = synIDattr(synID(a:lnum, 1, 1), 'name')
  " let nxt_syntax_group = synIDattr(synID(a:lnum + 1, 1, 1), 'name')

  let pounds = <sid>headerLevel(a:lnum)  " strlen(matchstr(getline(a:lnum), '^#\+'))
  let isCodeBlock = (cur_syntax_group ==? 'mkdCode' || cur_syntax_group ==? 'markdownCode')

  if (pounds && !isCodeBlock)
    return '>' . pounds  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if <sid>headerLevel(a:lnum + 1) " (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction

" let cur_syntax_group = synIDattr(synID(a:lnum, 1, 1), 'name')
" pythonComment

function! s:headerLevel(lnum)

	let l:codeSyntax = ['pythonComment', 'nimComment', 'perlComment', 'rComment', 'textSnipR', 'rubyComment', 'syntaxCode']

  let l:curSyntaxGroup = synIDattr(synID(a:lnum, 1, 1), 'name')
	" curSyntaxGroup =~? 'syntaxCode'

	if (index(l:codeSyntax, l:curSyntaxGroup) >= 0)
		let ans = 0
	else
		let ans = strlen(matchstr(getline(a:lnum), '^#\+'))  " header level / number of #
	endif

	return ans
endfunction




function! coding#compile()
	" if dein#tap('asynctasks.vim')
	" 	AsyncTask file-run
	" 	" AsyncTask file-build
	" else
	" 	execute("compiler " . &filetype)
	" 	make
	" end

	if &filetype == 'python'
		" compiler pyunit
		" set makeprg=python3\ %:p
		" silent make
		setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
		AsyncRun python3 %:p
	else
		execute("compiler " . &filetype)
		silent make
	end
	" Quickfix " qt-quickfix
	lua require('user').qflist.open()
endfunction



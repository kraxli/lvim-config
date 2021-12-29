
" ┌────────────────┐
" │ local settings │
" └────────────────┘

if has('unix')
	let g:python_host_prog = '/usr/bin/python'
	let g:python3_host_prog = '/usr/bin/python3'
	" let g:python3_host_prog = '/~/.pyenv/versions/python364/bin/python'

	"" To disable Python 2 support:
	" let g:loaded_python_provider = 1
else
	let g:python3_host_prog = 'C:/ProgramData/Anaconda3-5.2.0/python.exe'
endif


" ┌─────────────────────────────────────────────┐
" │ local settings of variables used in plugins │
" └─────────────────────────────────────────────┘
" vimwiki
let g:dir_dbox = '~/Dropbox/'
let g:dir_onedrive = '/home/dave/OneDrive/'
let g:dir_wiki = '~/Dropbox/PKD/'
let g:dir_blog = '~/Dropbox/PKD/blog_posts/'
let g:subdir_out = 'out/'

" kraxli/vim-snips
let g:dir_screenshots = '/home/dave/Pictures'
let g:dir_board = ''
let g:signature = "David Scherrer"

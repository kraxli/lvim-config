
# To Dos

- [ ] how to format with Lsp-formatter
- [◐] DAP: functionality:
  - [ ] automatically open repl
  - [✓] how to bring up scope, frames, ...
  - [ ] DAP telescope? Multiple adapters?
- [ ] apply right fonts such that also luatree items are all correct (especially file types)
- [ ] machakann/vim-sandwich or appelgriebsch/surround.nvim (surround)
- [ ] Telekasten
- CheckBox:
  - [ ] toggle checkBox function:
    - lua/utils/mkd.lua  (combination of functionality of bullets.nvim and Telekasten)
    - simply apply right function with <c-space> given the line pattern (normal and visual model. Visual mode via loop)
  - Telekasten: nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
  - Telekasten: inoremap <leader>zt <ESC>:lua require('telekasten').toggle_todo({ i=true })<CR>
- [✓] close Telescope with "q"
- [✓] LSP signature plugin?
- [ ] Gitblame sidebar
- [ ] load local settings

  ```vim
  let g:local_source_dir = fnamemodify(expand('<sfile>'), ':h').'/local/'

  " load local config / setting files
  if exists('g:local_source_dir') && isdirectory(g:local_source_dir)
     for file in split(globpath(g:local_source_dir, '*.vim'), '\n')
        " local/init.vim already loaded in init.vim (main init.vim file in parent directory)
        if file == g:local_source_dir . 'init.vim'
     continue
        endif
        execute 'source' file
     endfor
  endif
  ```

## Longer term / second prio

- [ ] copilot (tpope): https://github.com/github/copilot.vim
- [ ] unmap <leader>x for ToggleCheckbox in plugin bullets.vim


vim.cmd("command! Mappings enew|pu=execute('map')")

vim.cmd([[
  command! KeyMaps :call utils#KeyMaps()
  " save and quit
  command! W :w!
  command! Q :q
  cnoreabbrev <silent> ww w!
  cnoreabbrev <silent> wwa wa!
  cnoreabbrev <silent> xx x!
  cnoreabbrev <silent> xxa xa!
  cnoreabbrev <silent> qq q!
  cnoreabbrev <silent> qqa qa!
  cnoreabbrev <silent> ee e!
]])

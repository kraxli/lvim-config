
require'clipboard-image'.setup {
  default = {
		img_dir = 'img',
		img_dir_txt = 'img',
    img_name = function ()
      -- local img_dir = 'img' -- require'clipboard-image.config'.get_config().img_dir()
      return os.date('%Y-%m-%d-%H-%M-%S')
    end,
    affix = '![](%s)',
  },
  -- markdown = {
  --   img_dir = 'src/assets/img',
  --   img_dir_txt = '/assets/img',
  --   affix = '![](%s)',
  -- },
}


vim.g.sandwich_no_default_key_mappings = 1

vim.cmd([[
	" nmap ds <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	" nmap dss <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	" nmap cs <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	" nmap css <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

	nmap <silent> sa <Plug>(operator-sandwich-add)
	xmap <silent> sa <Plug>(operator-sandwich-add)
	omap <silent> sa <Plug>(operator-sandwich-add)
	" omap <silent> sa <Plug>(operator-sandwich-g@)

	nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sd <Plug>(operator-sandwich-delete)
	nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
	" nmap <unique> sd <Plug>(sandwich-delete)

	nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
	xmap <silent> sr <Plug>(operator-sandwich-replace)
	nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

	" omap ir <Plug>(textobj-sandwich-auto-i)
	" xmap ir <Plug>(textobj-sandwich-auto-i)
	" omap ab <Plug>(textobj-sandwich-auto-a)
	" xmap ab <Plug>(textobj-sandwich-auto-a)
	" omap is <Plug>(textobj-sandwich-query-i)
	" xmap is <Plug>(textobj-sandwich-query-i)
	" omap as <Plug>(textobj-sandwich-query-a)
	" xmap as <Plug>(textobj-sandwich-query-a)
]])

vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.listchars= { tab = '»-',trail = '-' ,eol ='↲',extends = '»',precedes ='«',nbsp = '%',space = '_' } -- タブや改行文字、末尾の半角スペースなど、通常は非表示の文字を表示する
vim.opt.list = true
vim.opt.expandtab = true		

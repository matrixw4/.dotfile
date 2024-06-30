-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.g.markdown_recommended_style = 0

require('base.options')
require('base.keymaps')
require('base.lazy')

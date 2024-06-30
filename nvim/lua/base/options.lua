local opt = vim.opt

-- OptionsList

local options = {
  backup = false,
  writebackup = false,
  swapfile = false,
  undofile = true,
  expandtab = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  number = true,
  relativenumber = true,
  numberwidth = 2,
  wrap = true,
  linebreak = true,
  breakindent = true,
  autoindent = true,
  smartindent = true,
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  cursorline = true,
  termguicolors = true,
  pumheight = 10,
  conceallevel = 0,
  updatetime = 200,
  timeoutlen = 500,
  scrolloff = 5,
  sidescrolloff = 5,
  showmode = false,
  showtabline = 2,
  splitright = true,
  splitbelow = true,
  clipboard = 'unnamedplus',
  mouse = 'a',
  completeopt = { 'menuone', 'noselect' },
  fileencoding = 'utf-8',
  signcolumn = 'yes',
  listchars = { trail = '·' },
  foldmethod = 'expr',
}

for k, v in pairs(options) do
  opt[k] = v
end

opt.shortmess:append('c')

if vim.fn.has('nvim-0.10') then
  opt.smoothscroll = true
end

-- AutoCommands

-- highlight on yanking (copying) text
vim.api.nvim_create_autocmd({ 'TextYankPost' }, {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- jump to the last position when reopening a file
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  callback = function()
    local last_position = vim.api.nvim_buf_get_mark(0, '"')
    vim.api.nvim_win_set_cursor(0, last_position)
  end,
})

-- disable auto commenting in a new line
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o', 'c' })
  end,
})

-- Auto Sync
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = '*',
  callback = function()
    vim.cmd(':checktime')
  end,
})

vim.api.nvim_create_autocmd({ 'FocusLost', 'BufLeave' }, {
  pattern = '*',
  callback = function()
    vim.cmd('silent! update')
  end,
})

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = vim.api.nvim_create_augroup('NvimTreeClose', { clear = true }),
  pattern = 'NvimTree_*',
  callback = function()
    local layout = vim.api.nvim_call_function('winlayout', {})
    if
      layout[1] == 'leaf'
      and vim.api.nvim_buf_get_option(
        vim.api.nvim_win_get_buf(layout[2]),
        'filetype'
      ) == 'NvimTree'
      and layout[3] == nil
    then
      vim.cmd('confirm quit')
    end
  end,
})

-- NeoVideOptions

if vim.g.neovide then
  opt.guifont = 'JetBrainsMono Nerd Font:h14'
  vim.g.neovide_scale_factor = 1.0

  -- dynamic scale
  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end
  vim.keymap.set('n', '<c-=>', function()
    change_scale_factor(1.25)
  end)
  vim.keymap.set('n', '<c-->', function()
    change_scale_factor(1 / 1.25)
  end)
end

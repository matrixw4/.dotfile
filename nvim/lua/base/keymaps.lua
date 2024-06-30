local key = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

key('n', '<c-a>', 'ggVG')
key({ 'n', 'i' }, '<c-z>', '<cmd>undo<cr>')

key('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit the window' })
key('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
key('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save & Quit' })

key({ 'n', 'v' }, 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
key({ 'n', 'v' }, 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

key({ 'n', 'v' }, 'gh', '^', { desc = 'Go to the begin of line' })
key({ 'n', 'v' }, 'gl', '$', { desc = 'Go to the end of line' })
key({ 'n', 'v' }, 'ge', 'G', { desc = 'Go to the last line' })

-- Normal --
-- Better window navigation
key('n', '<C-h>', '<C-w>h', opts)
key('n', '<C-j>', '<C-w>j', opts)
key('n', '<C-k>', '<C-w>k', opts)
key('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
key('n', '<C-Up>', ':resize -2<CR>', opts)
key('n', '<C-Down>', ':resize +2<CR>', opts)
key('n', '<C-Left>', ':vertical resize -2<CR>', opts)
key('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
key('n', '<S-l>', ':bnext<CR>', opts)
key('n', '<S-h>', ':bprevious<CR>', opts)

-- Move text up and down
key('n', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
key('n', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)

-- Insert --
-- Press jf fast to exit insert mode
key('i', 'jf', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
key('v', '<', '<gv', opts)
key('v', '>', '>gv', opts)

-- Move text up and down
key('v', '<A-j>', ':m .+1<CR>==', opts)
key('v', '<A-k>', ':m .-2<CR>==', opts)
key('v', 'p', '"_dP', opts)

-- Visual Block --
-- Move text up and down
key('x', 'J', ":move '>+1<CR>gv-gv", opts)
key('x', 'K', ":move '<-2<CR>gv-gv", opts)
key('x', '<A-j>', ":move '>+1<CR>gv-gv", opts)
key('x', '<A-k>', ":move '<-2<CR>gv-gv", opts)

key('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

--  show current buffer path
vim.cmd([[
  cnoreabbrev fd echo expand('%:p:h') 
]])

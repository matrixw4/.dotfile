-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
  ------------------------------ UI ------------------------------
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme('catppuccin-frappe')
    end,
    config = require('usr.ui.catppuccin'),
  },
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = require('usr.ui.alpha'),
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    lazy = true,
    --[[ after = "catppuccin", ]]
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    dependencies = { 'nvim-tree/nvim-web-devicons', 'shaunsingh/nord.nvim' },
    config = require('usr.ui.bufferline'),
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
    main = 'ibl',
    event = { 'CursorHold', 'CursorHoldI' },
    config = require('usr.ui.indentline'),
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    config = require('usr.ui.lualine'),
  },

  ------------------------------ Tools ------------------------------
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = true,
    cmd = {
      'NvimTreeToggle',
      'NvimTreeFindFile',
      'NvimTreeFindFileToggle',
      'NvimTreeRefresh',
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = require('usr.tools.tree'),
  },
  ------------------------------ telescope ------------------------------
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = 'Telescope',
    config = require('usr.tools.telescope'),
    dependencies = {
      { 'rafi/telescope-thesaurus.nvim' },
      { 'nvim-tree/nvim-web-devicons' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-live-grep-args.nvim' },
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable('make') == 1
        end,
      },
      'nvim-telescope/telescope-media-files.nvim',
    },
  },
  'nvim-telescope/telescope-ui-select.nvim',
  ------------------------------ Cmp ------------------------------
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = require('usr.cmp.autopairs'),
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = true,
    event = 'InsertEnter',
    config = require('usr.cmp.cmp'),
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = require('usr.cmp.luasnip'),
      },
      { 'lukas-reineke/cmp-under-comparator' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-path' },
      { 'f3fora/cmp-spell' },
      { 'hrsh7th/cmp-buffer' },
      { 'kdheepak/cmp-latex-symbols' },
      { 'ray-x/cmp-treesitter', commit = 'c8e3a74' },
    },
  },

  ------------------------------ lsp ------------------------------
  -- conformation plugin
  {
    'stevearc/conform.nvim',
    config = require('usr.lsp.conform'),
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = require('usr.lsp.mason') },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = require('usr.lsp.lsp'),
  },
  ------------------------------ Editor ------------------------------
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 300
    end,
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {},
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
  { 'tpope/vim-sleuth' },
  { 'numToStr/Comment.nvim', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = false,
    },
  },
  ------------------------------ Treesitter ------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = true,
    event = 'BufReadPost',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'luadoc',
        'vim',
        'vimdoc',
        'markdown',
        'cpp',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = {
        enable = true,
        disable = { 'ruby' },
      },
    },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      {
        'andymass/vim-matchup',
        init = function()
          vim.g.matchup_matchparen_offscreen = { method = 'popup' }
        end,
      },
      {
        'NvChad/nvim-colorizer.lua',
        config = require('usr.editor.colorizer'),
      },
    },
    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line:missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  ------------------------------ Dap ------------------------------
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
    config = require('usr.lsp.dap'),
  },
})

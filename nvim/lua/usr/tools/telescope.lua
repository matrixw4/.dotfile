return function()
  local telescope = require('telescope')

  telescope.load_extension('media_files')
  local builtin = require('telescope.builtin')
  local keys = vim.keymap.set

  keys('n', '<leader>f', builtin.find_files, {})
  keys('n', '<leader>g', builtin.live_grep, {})

  local lga_actions = require('telescope-live-grep-args.actions')
  local dropdown_configs = {
    --[[ layout_strategy = "vertical", ]]
    layout_strategy = 'cursor',
    layout_config = {
      --[[ prompt_position = "bottom", ]]
      vertical = {
        width = 0.4,
        height = 0.6,
      },
    },
  }

  local actions = require('telescope.actions')

  require('telescope').setup({
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      mappings = {
        i = {
          ['esc'] = actions.close,
        },
      },
      file_ignore_patterns = {
        'codegen.ts',
        '.git',
        'lazy-lock.json',
        '*-lock.yaml',
        'node_modules',
        '%.lock',
      },
      dynamic_preview_title = true,
      path_display = { 'smart' },
    },
    pickers = {
      find_files = {
        hidden = true,
      },
    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(dropdown_configs),
      },
      media_files = {
        filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
        find_cmd = 'rg', -- find command (defaults to `fd`)
      },
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
      live_grep_args = {
        auto_quoting = true, -- enable/disable auto-quoting
        -- define mappings, e.g.
        mappings = { -- extend mappings
          i = {
            ['<C-k>'] = lga_actions.quote_prompt(),
            ['<C-i>'] = lga_actions.quote_prompt({ postfix = ' --iglob ' }),
          },
        },
      },
      thesaurus = {
        provider = 'freedictionaryapi',
      },
    },
  })
  require('telescope').load_extension('ui-select')
  require('telescope').load_extension('live_grep_args')
end

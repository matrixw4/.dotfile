return function()
  require('catppuccin').setup({
    transparent_background = false,
    show_end_of_buffer = false,
    dim_inactive = {
      enable = true,
      shade = 'dark',
      percentage = 0.45,
    },
    no_italic = false,
    no_bold = false,
    no_underline = false,
    styles = {
      comments = { 'italic' },
      properties = { 'bold' },
      functions = { 'bold' },
      keywords = { 'italic' },
      operators = { 'bold' },
      conditionals = { 'italic' },
      loops = { 'italic' },
      booleans = { 'bold', 'italic' },
      numbers = {},
      types = {},
      strings = {},
      variables = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      treesitter_context = false,
      notify = false,
      alpha = true,
      flash = true,
      lsp_saga = false,
      indent_blankline = {
        enabled = true,
        scope_color = 'flamingo', -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = false,
      },
      which_key = false,
      lsp_trouble = false,
      telescope = {
        enabled = true,
        -- style = "nvchad"
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        underlines = {
          errors = { 'underline' },
          hints = { 'underline' },
          warnings = { 'underline' },
          information = { 'underline' },
        },
        inlay_hints = {
          background = true,
        },
      },
      ufo = true,
    },
  })
end

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

return function()
  local opts = {
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    update_cwd = false,
    open_on_tab = false,
    sort = {
      sorter = 'case_sensitive',
      folders_first = true,
      files_first = false,
    },
    view = {
      adaptive_size = false,
      width = 35,
      cusorline = true,
      side = 'left',
    },
    renderer = {
      root_folder_modifier = ':t',
      group_empty = true,
      full_name = true,
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          default = '',
          symlink = '',
          folder = {
            arrow_open = '',
            arrow_closed = '>',
            empty = '',
            empty_open = '',
            default = '',
            open = '',

            symlink = '',
            symlink_open = '',
          },
          git = {
            unstaged = '',
            staged = 'S',
            unmerged = '',
            renamed = '➜',
            untracked = 'U',
            deleted = '',
            ignored = '◌',
          },
        },
      },
    },
    filters = {
      dotfiles = true,
      custom = {
        '^.git$',
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
  }

  require('nvim-web-devicons').setup({
    override = {
      zsh = {
        icon = '',
        color = '#428850',
        cterm_color = '65',
        name = 'zsh',
      },
    },
    default = true,
  })
  require('nvim-tree').setup(opts)
end

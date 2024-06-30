return function()
  local builtin = require('telescope.builtin')
  local lsp = vim.lsp.buf

  vim.api.nvim_create_autocmd({ 'LspAttach' }, {
    callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set(
          'n',
          keys,
          func,
          { buffer = event.buf, desc = 'LSP: ' .. desc }
        )
      end
      map('gd', builtin.lsp_definitions, 'Go to definitions')
      map('gr', builtin.lsp_references, 'Go to references')
      map('gI', builtin.lsp_implementations, 'Go to implementations')
      map('<leader>D', builtin.lsp_type_definitions, 'Type definitions')
      map('<leader>r', lsp.rename, 'Rename')
      map('<leader>k', lsp.hover, 'Hover documentation')
      map('gD', lsp.declaration, 'Go to declaration')
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_group =
          vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = event.buf,
          group = highlight_group,
          callback = lsp.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = event.buf,
          group = highlight_group,
          callback = lsp.clear_references,
        })
      end
    end,
  })

  vim.api.nvim_create_autocmd({ 'LspDetach' }, {
    callback = function(event)
      lsp.clear_references()
      vim.api.nvim_clear_autocmds({
        group = 'lsp-highlight',
        buffer = event.buf,
      })
    end,
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend(
    'force',
    capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )
  local servers = {
    clangd = {},
    rust_analyzer = {},
    lua_ls = {
      settings = {
        completion = {
          callSnippet = 'Replace',
        },
        Lua = {
          diagnostics = {
            globals = {
              'vim',
              'buf',
            },
          },
        },
      },
    },
  }
  require('mason').setup()

  local ensure_installed = vim.tbl_keys(servers or {})
  vim.list_extend(ensure_installed, {
    'stylua',
  })

  require('mason-tool-installer').setup({
    ensure_installed = ensure_installed,
  })

  require('mason-lspconfig').setup({
    handlers = {
      function(server_name)
        local server = servers[server_name] or {}
        server.capabilities = vim.tbl_deep_extend(
          'force',
          {},
          capabilities,
          server.capabilities or {}
        )
        require('lspconfig')[server_name].setup(server)
      end,
    },
  })
end

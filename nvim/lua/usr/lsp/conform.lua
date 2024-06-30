return function()
  require('conform').setup({
    notify_on_error = false,
    formatters_by_ft = {
      lua = { 'stylua' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  })
end

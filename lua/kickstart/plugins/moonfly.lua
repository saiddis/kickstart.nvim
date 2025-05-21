return {
  'bluz71/vim-moonfly-colors',
  name = 'moonfly',
  lazy = false,
  priority = 1000,

  config = function()
    vim.g.moonflyNormalFloat = true
    vim.diagnostic.config { float = { border = 'single' } }
    vim.g.moonflyTransparent = false
    vim.g.moonflyUndercurls = true
    vim.g.moonflyWinSeparator = 0
    vim.g.moonflyUnderlineMatchParen = true
    vim.g.moonflyItalics = true
    vim.g.nightflyCursorColor = true

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = 'single',
    })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
      border = 'single',
    })

    local custom_highlight = vim.api.nvim_create_augroup('CustomHighlight', {})
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = 'moonfly',
      callback = function()
        vim.api.nvim_set_hl(0, 'Normal', { bg = '#000000' })
      end,
      group = custom_highlight,
    })

    -- vim.cmd()

    vim.cmd [[colorscheme moonfly]]
    local colors = require('moonfly').palette
    local TelescopeColor = {
      TelescopeMatching = { fg = colors.coral },
      TelescopeSelection = { fg = colors.text, bg = colors.bay, bold = true },

      TelescopePromptPrefix = { bg = colors.black },
      TelescopePromptNormal = { bg = colors.black },
      TelescopeResultsNormal = { bg = colors.black },
      TelescopePreviewNormal = { bg = colors.black },
      TelescopePromptBorder = { bg = colors.black, fg = colors.black },
      TelescopeResultsBorder = { bg = colors.black, fg = colors.black },
      TelescopePreviewBorder = { bg = colors.black, fg = colors.black },
      TelescopePromptTitle = { bg = colors.black, fg = colors.black },
      TelescopeResultsTitle = { fg = colors.text },
      TelescopePreviewTitle = { bg = colors.black, fg = colors.black },
    }

    for hl, col in pairs(TelescopeColor) do
      vim.api.nvim_set_hl(0, hl, col)
    end
  end,
}

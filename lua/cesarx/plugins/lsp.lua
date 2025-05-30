return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- Configurar Mason
    require('mason').setup()

    -- Configurar Mason-lspconfig para la instalación automática de LSPs
    require('mason-lspconfig').setup({
      automatic_installation = true,
    })


    -- Mapeos de teclado para acciones de LSP cuando un servidor se adjunta al buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(args)
        local bufnr = args.buf
        local buf_set_keymap = vim.api.nvim_buf_set_keymap
        local opts = { noremap = true, silent = true }

        -- Mapeo clave para las acciones de código (incluye "Show Preview" de Slint)
        buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

        -- Otros mapeos comunes de LSP (puedes añadir o quitar según tus necesidades)
        buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
        buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
        -- ...
      end,
    })

  end,
}

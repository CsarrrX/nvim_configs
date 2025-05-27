-- Archivo: ~/.config/nvim/lua/plugins/rust-lsp.lua
-- o donde tengas tus plugins configurados

return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      -- PRIMERO: Configurar Mason
      require('mason').setup()
      
      -- SEGUNDO: Configurar mason-lspconfig
      require('mason-lspconfig').setup({
        ensure_installed = { 'rust_analyzer' },
        automatic_installation = true,
      })

      -- Configuración de rust-analyzer
      local lspconfig = require('lspconfig')
      
      -- Función para mapeos de teclado cuando LSP se conecta
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Navegación
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        
        -- Información
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        
        -- Acciones
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>f', function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        
        -- Diagnósticos
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
      end

      -- Configurar rust-analyzer
      lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        settings = {
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true
            },
            checkOnSave = {
              command = 'cargo clippy'
            },
            diagnostics = {
              enable = true,
              experimental = {
                enable = true,
              },
            },
          },
        },
      })
    end,
  }
}

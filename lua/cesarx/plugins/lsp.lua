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
        automatic_installation = true,
      })

    end,
  }
}

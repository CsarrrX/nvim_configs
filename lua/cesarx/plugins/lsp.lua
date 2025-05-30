return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    -- PRIMERO: Configurar Mason
    require('mason').setup()

    -- SEGUNDO: Configurar Mason-lspconfig
    require('mason-lspconfig').setup({
      automatic_installation = true,
    })

  end
}

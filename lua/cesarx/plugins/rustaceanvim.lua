return {
  'mrcjkb/rustaceanvim',
  version = '^4', 
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(_, bufnr)
          -- Configura tus mappings de LSP aquí si usas alguno
        end,
      },
    }
  end,
}


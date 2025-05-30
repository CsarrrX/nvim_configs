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
        default_settings = {
          ['rust-analyzer'] = {
            checkOnSave = true, -- Usa el comando por defecto del proyecto (cargo check/clippy)
            diagnostics = {
              enable = true,
              disabled = { "unresolved-proc-macro" }, -- opcional
            },
            cargo = {
              allFeatures = true,
            },
          },
        },
      },
    }
  end,
}


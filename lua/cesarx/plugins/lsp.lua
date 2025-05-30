return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'simrat39/rust-tools.nvim',  -- Mover la dependencia aquí
  },
  config = function()
    -- PRIMERO: Configurar Mason
    require('mason').setup()

    -- SEGUNDO: Configurar Mason-lspconfig
    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = { "rust_analyzer" }  -- Asegurar que rust-analyzer esté instalado
    })

    -- TERCERO: Configurar rust-tools
    local rt = require("rust-tools")  -- Corregido el nombre (era "rüst-tools")

    rt.setup({
      server = {
        settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = true,  -- Habilitar verificaciones al guardar
                        cargo = {
                            clippy = {
                                features = "all",  -- Opcional: habilitar todos los features
                            },
                        },
                    },
                },
        on_attach = function(_, bufnr)
          -- Hover actions (corregido "\n" por "n" para modo normal)
          vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { 
            buffer = bufnr,
            desc = "Rust hover actions" 
          })

          -- Code action groups
          vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { 
            buffer = bufnr,
            desc = "Rust code actions" 
          })
        end,
      }
    })
  end
}

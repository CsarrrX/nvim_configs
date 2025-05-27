return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x', -- Rama estable
  dependencies = {
    'nvim-lua/plenary.nvim', -- Dependencia obligatoria
    -- Opcional, pero muy recomendado para rendimiento:
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local builtin = require('telescope.builtin')

    -- Configuración básica de Telescope
    require('telescope').setup({
      defaults = {
        -- Puedes ajustar el diseño aquí si lo necesitas
        -- layout_strategy = 'vertical',
        -- layout_config = {
        --   vertical = {
        --     width = 0.9,
        --     height = 0.9,
        --     preview_height = 0.6,
        --   },
        -- },
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
        },
      },
      extensions = {
        -- Carga la extensión fzf si la instalaste
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- Carga la extensión fzf si está disponible
    pcall(require('telescope').load_extension, 'fzf')

    -- Mapeos esenciales
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp Tags' })
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = '[F]ind [O]ld Files' })
  end,
}

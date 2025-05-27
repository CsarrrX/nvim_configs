local opts = {noremap = true, silent = true}

-- Leader Key
vim.g.mapleader = " "
vim.gmaplocalleader = " "

-- Centrar el cursor scrolleando con Ctrl-D y Ctrl-U
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Mover lineas con > y <
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Deletear con x sin que se copie a clipboard
vim.keymap.set("n", "x", '"_x', opts)

-- Busqueda y reemplazamiento global bajo el cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Replace word cursor is on globally" })

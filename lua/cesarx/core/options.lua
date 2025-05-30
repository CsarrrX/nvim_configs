-- Desactivar el banner del ex
vim.cmd("let g:netrw_banner = 0 ")

-- Cursor de bloque
vim.opt.guicursor = ""

-- Números de linea
vim.opt.nu = true
vim.opt.relativenumber = true 

-- Indetaciones y tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- Files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Ui / Visuals
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"  

-- Clipboard y mouse
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse = "a"

-- Reconocimiento automático para archivos .slint
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.slint",
  callback = function()
    vim.o.filetype = "slint"
  end,
})

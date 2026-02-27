-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.bufferline = false
vim.opt.wrap = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.laststatus = 3

vim.opt.termguicolors = true -- Enable true colors
vim.cmd([[highlight Normal guibg=NONE ctermbg=NONE]]) -- Set background to none (transparent)
vim.cmd([[highlight NonText guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight NormalNC guibg=NONE ctermbg=NONE]])
vim.cmd([[highlight SignColumn guibg=NONE ctermbg=NONE]])

vim.g.snacks_animate = false

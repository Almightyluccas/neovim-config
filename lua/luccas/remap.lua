vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>pV', ':Vex<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ph', ':Hex<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader><CR>', ':w<CR>:so ~/.config/nvim/init.lua<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })

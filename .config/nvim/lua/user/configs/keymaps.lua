local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Quality of Life
keymap("n", "<leader><Space>", ":w<CR>", opts)
keymap("n", "<leader>j", "8j", opts)
keymap("n", "<leader>k", "8k", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Telescope Keymaps
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes'))<cr>", opts)

-- BufferLine Keymaps
keymap("n", "H", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "L", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>d", ":BufferLinePick<CR>", opts)
keymap("n", "<leader>w", ":Bdelete!<CR>", opts)

-- NvimTree Keymaps
keymap("n", "<leader>t", ":NvimTreeToggle<CR>", opts)

-- ToggleTerm Keymaps
keymap("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<cr>", opts)

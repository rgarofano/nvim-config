-- Saving a buffer
vim.keymap.set("n", "<C-s>", "<cmd>w<Enter>")
-- Closing a buffer
vim.keymap.set("n", "<C-w>", "<cmd>q<Enter>")
-- Swapping between buffers
vim.keymap.set("n", "<BS>", "<cmd>e #<Enter>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<Enter>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<Enter>")
-- Quick fix lists
vim.keymap.set("n", "<C-q>", "<C-q><cmd>cclose<Enter>", { noremap = true })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<Enter>zz")
vim.keymap.set("n", "<C-N>", "<cmd>cprevious<Enter>zz")
-- Better page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

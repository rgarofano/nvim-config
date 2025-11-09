-- Saving a buffer
vim.keymap.set("n", "<C-s>", "<cmd>w<Enter>")
-- Close all windows
vim.keymap.set("n", "<C-S-w>", "<cmd>qa<Enter>")
-- Closing a buffer
vim.keymap.set("n", "<C-w>", "<cmd>q<Enter>")
-- Swapping between buffers
vim.keymap.set("n", "<BS>", "<cmd>e #<Enter>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<Enter>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<Enter>")
-- Quick fix lists
vim.keymap.set("n", "<C-n>", "<cmd>cnext<Enter>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprevious<Enter>zz")
-- Better page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

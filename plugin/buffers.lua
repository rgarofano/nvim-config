-- Navigate jump list using backspace
vim.keymap.set("n", "<BS>", "<C-o>")
vim.keymap.set("n", "<S-BS>", "<C-i>")
-- Switch to alternate file easier
vim.keymap.set("n", "<Tab>", "<cmd>e #<Enter>")
-- Quick fix lists
vim.keymap.set("n", "<C-n>", "<cmd>cnext<Enter>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprevious<Enter>zz")
-- Better page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

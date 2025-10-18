-- Windows
vim.keymap.set({ "n", "i", "t" }, "<C-h>","<cmd>wincmd h<Enter>")
vim.keymap.set({ "n", "i", "t" }, "<C-j>","<cmd>wincmd j<Enter>")
vim.keymap.set({ "n", "i", "t" }, "<C-k>","<cmd>wincmd k<Enter>")
vim.keymap.set({ "n", "i", "t" }, "<C-l>","<cmd>wincmd l<Enter>")
-- Swapping between buffers
vim.keymap.set("n", "<BS>", "<cmd>e #<Enter>")
vim.keymap.set("n", "<Tab>", "<cmd>bnext<Enter>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<Enter>")
-- Cycling through quick fix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<Enter>zz")
vim.keymap.set("n", "<C-N>", "<cmd>cprevious<Enter>zz")
-- Better page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

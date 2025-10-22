-- Copying to system clipboard
vim.keymap.set("v", "<C-c>", '"+y')
-- Pasting from system clipboard
vim.keymap.set("i", "<C-v>", "<C-r>+")
vim.keymap.set("t", "<C-v>", [[<C-\><C-n>"+pi]])
-- Remap visual block mode since I'm using Ctrl+v for paste
vim.keymap.set("n", "<leader>v", "<C-v>", { noremap = true })

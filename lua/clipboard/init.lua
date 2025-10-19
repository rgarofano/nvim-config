-- Copying to system clipboard
vim.keymap.set("v", "<C-c>", '"+y')
-- Pasting from system clipboard
vim.keymap.set("i", "<C-v>", "<C-r>+")
vim.keymap.set('t', '<C-v>', [[<C-\><C-n>"+pi]])

-- Create new tab
vim.keymap.set("n", "<C-t>", "<cmd>tabnew<Enter>")
-- Move window to tab
vim.keymap.set("n", "<C-S-t>", "<C-w>T")
-- Cycle through tabs
vim.keymap.set('n', '<Tab>', '<cmd>tabnext<Enter>', { silent = true })
vim.keymap.set('n', '<S-Tab>', '<cmd>tabprevious<Enter>', { silent = true })

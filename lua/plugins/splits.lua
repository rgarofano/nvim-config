return {
    "mrjones2014/smart-splits.nvim",
    config = function()
        -- Move between splits
        vim.keymap.set({ "n", "t" }, "<M-h>", "<cmd>wincmd h<Enter>")
        vim.keymap.set({ "n", "t" }, "<M-j>", "<cmd>wincmd j<Enter>")
        vim.keymap.set({ "n", "t" }, "<M-k>", "<cmd>wincmd k<Enter>")
        vim.keymap.set({ "n", "t" }, "<M-l>", "<cmd>wincmd l<Enter>")

        local split = require("smart-splits")
        -- Resize splits
        vim.keymap.set({ "n", "t" }, "<M-S-h>", split.resize_left)
        vim.keymap.set({ "n", "t" }, "<M-S-j>", split.resize_down)
        vim.keymap.set({ "n", "t" }, "<M-S-k>", split.resize_up)
        vim.keymap.set({ "n", "t" }, "<M-S-l>", split.resize_right)
        -- Move split buffers around
        vim.keymap.set({ "n", "t" }, "<M-Left>", split.swap_buf_left)
        vim.keymap.set({ "n", "t" }, "<M-Down>", split.swap_buf_down)
        vim.keymap.set({ "n", "t" }, "<M-Up>", split.swap_buf_up)
        vim.keymap.set({ "n", "t" }, "<M-Right>", split.swap_buf_right)
    end
}

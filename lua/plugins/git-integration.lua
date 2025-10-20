return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup()
        vim.keymap.set("n", "gK", "<cmd>Gitsigns preview_hunk<Enter>")
        vim.keymap.set("n", "<C-g>", "<cmd>Gitsigns next_hunk<Enter>")
        vim.keymap.set("n", "<C-S-g>", "<cmd>Gitsigns prev_hunk<Enter>")
        vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<Enter>")
        vim.keymap.set("n", "<leader>gu", "<cmd>Gitsigns reset_hunk<Enter>")
    end,
}

return {
    "stevearc/oil.nvim",
    config = function()
        require("oil").setup({
            keymaps = {
                ["<C-s>"] = false,
                ["<C-h>"] = false,
                ["<C-t>"] = false,
                ["<C-p>"] = false,
                ["<C-c>"] = false,
                ["<C-l>"] = false,
                ["K"] = "actions.preview"
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
}

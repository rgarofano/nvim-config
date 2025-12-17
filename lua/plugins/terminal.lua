return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup()
        vim.keymap.set({ "n", "t" }, "\\f", "<cmd>ToggleTerm direction=float<Enter>")
        -- Easily switch to normal mode for copying, scrolling, etc.
        vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
        -- Open terminal in current window
        vim.keymap.set("n", "\\t", function()
            vim.cmd.terminal()
            vim.cmd("startinsert")
        end)
        -- Open terminal in horizontal split
        vim.keymap.set({ "n", "t" }, "\\s", function()
            vim.cmd.split()
            vim.cmd.terminal()
            vim.cmd("startinsert")
        end)
        -- Open terminal in vertical split
        vim.keymap.set({ "n", "t" }, "\\v", function()
            vim.cmd.vsplit()
            vim.cmd.terminal()
            vim.cmd("startinsert")
        end)
        -- Always start in insert mode when moving to a terminal window
        vim.api.nvim_create_autocmd("WinEnter", {
            pattern = { "term://*" },
            callback = function()
                vim.cmd("startinsert")
            end
        })
    end
}

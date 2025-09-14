return {
    "tpope/vim-rails",
    config = function()
        vim.keymap.set("n", "gc", "<cmd>Econtroller<CR>")
        vim.keymap.set("n", "gv", "<cmd>Eview<CR>")
        vim.keymap.set("n", "gm", "<cmd>Emodel<CR>")
        vim.keymap.set("n", "<leader>rc", function()
            vim.cmd.split()
            vim.cmd("terminal bin/rails console")
            vim.cmd("startinsert")
        end)
    end
}

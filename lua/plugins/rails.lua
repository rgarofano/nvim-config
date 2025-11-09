return {
    "tpope/vim-rails",
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.name == "ruby_lsp" then
                    vim.keymap.set("n", "gC", "<cmd>Econtroller<CR>")
                    vim.keymap.set("n", "gV", "<cmd>Eview<CR>")
                    vim.keymap.set("n", "gM", "<cmd>Emodel<CR>")
                    vim.keymap.set("n", "<leader>rc", function()
                        vim.cmd.split()
                        vim.cmd("terminal bin/rails console")
                        vim.cmd("startinsert")
                    end)
                end
            end
        })
    end
}

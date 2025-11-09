return {
    "rmagatti/auto-session",
    lazy = false,
    opts = {
        suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
    },
    keys = {
        { "<leader>ps", "<cmd>AutoSession search<Enter>", desc = "Pick session" },
    },
}

-- Easily switch to normal mode for copying, scrolling, etc.
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
-- Open terminal in horizontal split
vim.keymap.set({ "n", "t" }, "\\h", function()
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

local state = {
    floating = {
        buf = -1,
        win = -1,
    }
}

local function create_floating_window(opts)
    -- Get the editor dimensions
    local columns = vim.o.columns
    local lines = vim.o.lines

    -- Default width and height: 80% of the editor
    local width = math.floor((opts and opts.width or columns * 0.8))
    local height = math.floor((opts and opts.height or lines * 0.8))

    -- Center the window
    local col = math.floor((columns - width) / 2)
    -- `lines` includes the command line, so subtract 2 for safety
    local row = math.floor((lines - height) / 2) - 1

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    -- Define window options
    local win_opts = {
        style = "minimal",
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
    }

    -- Create the window
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    return { buf = buf, win = win }
end

local function toggle_floating_terminal()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_floating_window({ buf = state.floating.buf })
        if vim.bo[state.floating.buf].buftype ~= "terminal" then
            vim.cmd.terminal()
        end
        vim.cmd.startinsert()
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end

vim.api.nvim_create_user_command("FloatingTerminal", toggle_floating_terminal, {})

vim.keymap.set({ "n", "t" }, "\\t", "<cmd>FloatingTerminal<Enter>")

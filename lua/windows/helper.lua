local helper = {}

function helper.resize_window(direction)
    local curwin = vim.api.nvim_get_current_win()
    local wininfo = vim.fn.getwininfo(curwin)[1]

    if direction == "left" or direction == "right" then
        local total_cols = vim.o.columns
        local right_edge = wininfo.wincol + wininfo.width
        if (direction == "left" and right_edge >= total_cols) or (direction == "right" and right_edge < total_cols) then
            vim.cmd("vertical resize +2")
        else
            vim.cmd("vertical resize -2")
        end
    elseif direction == "up" or direction == "down" then
        local wins = vim.api.nvim_tabpage_list_wins(0)
        local max_bottom = 0
        for _, w in ipairs(wins) do
            local info = vim.fn.getwininfo(w)[1]
            local bottom = info.winrow + info.height - 1
            if bottom > max_bottom then
                max_bottom = bottom
            end
        end
        local bottom_edge = wininfo.winrow + wininfo.height - 1
        if (direction == "up" and bottom_edge >= max_bottom) or (direction == "down" and bottom_edge < max_bottom) then
            vim.cmd("resize +2")
        else
            vim.cmd("resize -2")
        end
    end
end

function helper.swap_window_buffers(direction)
    local win = vim.api.nvim_get_current_win()

    -- Map directions to wincmd
    local dir_map = { left = "h", down = "j", up = "k", right = "l" }
    local move = dir_map[direction]
    if not move then return end

    -- Try to move to the neighbor
    local ok, _ = pcall(function() vim.cmd("wincmd " .. move) end)
    if not ok then return end  -- no neighbor in that direction

    local neighbor = vim.api.nvim_get_current_win()

    -- Get buffers
    local buf1 = vim.api.nvim_win_get_buf(win)
    local buf2 = vim.api.nvim_win_get_buf(neighbor)

    -- Get cursor positions
    local cur1 = vim.api.nvim_win_get_cursor(win)
    local cur2 = vim.api.nvim_win_get_cursor(neighbor)

    -- Swap buffers
    vim.api.nvim_win_set_buf(win, buf2)
    vim.api.nvim_win_set_buf(neighbor, buf1)

    -- Swap cursors
    vim.api.nvim_win_set_cursor(win, cur2)
    vim.api.nvim_win_set_cursor(neighbor, cur1)
end

return helper

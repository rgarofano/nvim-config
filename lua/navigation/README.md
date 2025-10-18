# navigation.nvim
Swap between open buffers and windows with ease. Vim offers a lot of functionality when it comes to quickly swapping between open buffers, but I've always found them to be unintuitive and or lacking that native feel that I have with other vim motions. This plugin sets up the following keymaps aligned with my taste:

|                   Function                   |           Mode           |    Keymap    |
| -------------------------------------------- | ------------------------ | ------------ |
| Move to adjacent window on the left          | Normal, Insert, Terminal |   `Ctrl+h`   |
| Move to adjacent window below                | Normal, Insert, Terminal |   `Ctrl+j`   |
| Move to adjacent window above                | Normal, Insert, Terminal |   `Ctrl+k`   |
| Move to adjacent window on the right         | Normal, Insert, Terminal |   `Ctrl+l`   |
| Jump back to the last buffer you were in     | Normal                   |  `Backspace` |
| Cycle to the next open buffer                | Normal                   |     `Tab`    |
| Cycle to the previous open buffer            | Normal                   |  `Shift+Tab` |

Additonally, I recommend using the [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) plugin which provides fuzzy finding and live grep functionality that is performant and visually appealing. One thing that I like to do is pipe the results of live grep into a quick fix list with the default Ctrl+q mapping. That way, I can cycle through each of the results jumping to the relevant file as I do. This plugin sets up a couple custom mappings to streamline this process:

|                           Function                           |  Mode  |      Keymap      |
| ------------------------------------------------------------ | ------ | ---------------- |
| Jump to next result in the quick fix list                    | Normal |   `Ctrl+n`       |
| Jump to previous result in the quick fix list                | Normal |   `Ctrl+Shift+n` |

Finally, if you haven't already you'll want to setup an lsp for the programming language(s) you work with. This will give you jump to definition capabitlities, live error detection, and more. This plugin is not for LSP setup but I would be remiss not to mention it as it does greatly improve code navigation.

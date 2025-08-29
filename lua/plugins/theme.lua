local fallback = {
  {
    "bluz71/vim-nightfly-colors",
    lazy = false, priority = 1000,
    config = function()
      vim.g.nightflyTransparent = false
      vim.cmd.colorscheme("nightfly")
    end,
  },
  {
    "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "nightfly",
          section_separators = "",
          component_separators = "",
        }
      })
    end,
  },
}

local themes = {
  catppuccin = {
    url = "catppuccin/nvim",
    setup = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })
    end
  },
  everforest = {
    url = "neanias/everforest-nvim",
  },
  tokyonight = {
    url = "folke/tokyonight.nvim",
    setup = function()
      require("tokyonight").setup({
        opts = { style = "moon" },
        transparent = true,
      })
    end,
  },
}

-- Load the dynamically generated omarchy theme spec
local ok, generated = pcall(dofile, vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua"))
if not ok then
  vim.notify("No generated theme found", vim.log.levels.WARN)
  return fallback
end

-- Extract colorscheme from omarchy theme spec
local colorscheme
for _, plugin in ipairs(generated) do
  if type(plugin) == "table" and #plugin > 0 and plugin.opts then
    colorscheme = plugin.opts.colorscheme or colorscheme
  end
end

if colorscheme and themes[colorscheme] then
  return {
    {
      themes[colorscheme].url,
      lazy = false,
      priority = 1000,
      config = function()
        if themes[colorscheme].setup then
          themes[colorscheme].setup()
        end
        vim.cmd.colorscheme(colorscheme)
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local theme = vim.g.colors_name or "default"
        require("lualine").setup({
          options = {
            theme = theme,
            section_separators = "",
            component_separators = "",
          }
        })
      end,
    },
  }
else
  return fallback
end

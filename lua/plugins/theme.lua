local fallback = {
  {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nightflyTransparent = false
      vim.cmd.colorscheme("nightfly")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

-- Load the dynamically generated theme spec
local ok, generated = pcall(dofile, vim.fn.expand("~/.config/omarchy/current/theme/neovim.lua"))
if not ok then
  vim.notify("No generated theme found", vim.log.levels.WARN)
  return fallback
end

-- Extract info from generated theme
local url, colorscheme
for i, plugin in ipairs(generated) do
  if type(plugin) == "table" and #plugin > 0 then
    if i == 1 and type(plugin[1]) == "string" then
      url = plugin[1]
    elseif plugin.opts then
      colorscheme = plugin.opts.colorscheme or colorscheme
    end
  end
end

if url and colorscheme then
  return {
    {
      url,
      lazy = false,
      priority = 1000,
      config = function()
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

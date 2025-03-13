return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Options: latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true,
      term_colors = true,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = false,
        treesitter = true,
        which_key = true,
        -- For more integrations, see the wiki
      },
      color_overrides = {},
      custom_highlights = {},
    })

    -- Set the colorscheme
    vim.cmd([[colorscheme catppuccin]])

    -- Toggle background transparency function
    local transparent_mode = true
    local toggle_transparency = function()
      transparent_mode = not transparent_mode
      require("catppuccin").setup({ transparent_background = transparent_mode })
      vim.cmd([[colorscheme catppuccin]])
    end

    -- Keep your keybinding
    vim.keymap.set("n", "bg", toggle_transparency, { noremap = true, silent = true })
  end,
}

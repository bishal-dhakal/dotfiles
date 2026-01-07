-- Kanagawa: Modern, elegant colorscheme inspired by Japanese art
-- One of the most popular and well-maintained Neovim themes
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false, -- Load immediately
  config = function()
    require("kanagawa").setup({
      compile = false, -- Faster startup
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true, -- Full transparency
      dimInactive = false,
      terminalColors = true,
      theme = "wave", -- Options: "wave", "dragon", "lotus"

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none", -- Remove gutter background
            },
          },
        },
      },

      overrides = function(colors)
        return {
          -- Transparent backgrounds for all UI elements
          Normal = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          SignColumn = { bg = "none" },
          EndOfBuffer = { bg = "none" },
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          Pmenu = { bg = "none" },
          PmenuSel = { bg = "none" },
          WhichKeyFloat = { bg = "none" },
          NvimTreeNormal = { bg = "none" },
          NvimTreeNormalNC = { bg = "none" },
        }
      end,
    })

    vim.cmd("colorscheme kanagawa-wave")
  end,
}

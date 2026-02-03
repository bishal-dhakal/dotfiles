return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false, -- load immediately
  config = function()
    require("catppuccin").setup({
      flavor = "mocha", -- IntelliJ-like dark theme
      transparent_background = true, -- basic editor transparency
      styles = {
        comments = { "italic" },
        keywords = { "italic" },
        statements = { "bold" },
        functions = {},
        types = {},
      },
      integrations = {
        nvimtree = true,
        telescope = true,
        which_key = true,
        cmp = true,
        gitsigns = true,
        lsp_trouble = true,
        notify = true,
      },
      custom_highlights = function(colors)
        return {
          -- Full transparent backgrounds
          Normal = { bg = "none" },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          SignColumn = { bg = "none" },
          EndOfBuffer = { bg = "none" },
          LineNr = { bg = "none" },
          CursorLineNr = { bg = "none" },
          Pmenu = { bg = "none" },
          PmenuSel = { bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          WhichKeyFloat = { bg = "none" },
          NvimTreeNormal = { bg = "none" },
          NvimTreeNormalNC = { bg = "none" },
        }
      end,
    })

    -- Activate the colorscheme
    vim.cmd("colorscheme catppuccin")

    -- Extra: Ensure floating windows from LSP/Telescope/etc. are transparent
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
      hi Pmenu guibg=NONE ctermbg=NONE
      hi PmenuSel guibg=NONE ctermbg=NONE
      hi TelescopeNormal guibg=NONE ctermbg=NONE
      hi TelescopeBorder guibg=NONE ctermbg=NONE
      hi WhichKeyFloat guibg=NONE ctermbg=NONE
      hi NvimTreeNormal guibg=NONE ctermbg=NONE
      hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
    ]])
  end,
}

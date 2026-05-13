return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", -- Options: storm, moon, night, day
    transparent = true, -- This handles standard Normal/Float transparency automatically
    styles = {
      sidebars = "transparent", -- Sets NvimTree etc. to transparent
      floats = "transparent", -- Sets Telescope/Floats to transparent
    },
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    require("tokyonight").load()

    -- Manual overrides for plugins that might not catch the 'transparent' flag
    vim.cmd([[
      hi NvimTreeNormal guibg=NONE ctermbg=NONE
      hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
      hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
      hi NvimTreeWinSeparator guibg=NONE ctermbg=NONE
      hi TelescopeNormal guibg=NONE ctermbg=NONE
      hi TelescopeBorder guibg=NONE ctermbg=NONE
      hi TelescopePromptNormal guibg=NONE ctermbg=NONE
      hi TelescopePromptBorder guibg=NONE ctermbg=NONE
      hi TelescopeResultsNormal guibg=NONE ctermbg=NONE
      hi TelescopeResultsBorder guibg=NONE ctermbg=NONE
      hi TelescopePreviewNormal guibg=NONE ctermbg=NONE
      hi TelescopePreviewBorder guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
    ]])
  end,
}

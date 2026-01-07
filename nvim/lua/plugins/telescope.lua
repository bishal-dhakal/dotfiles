-- Telescope Configuration
-- Enhanced fuzzy finder with custom keymaps and ignore patterns
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- Extend LazyVim's default telescope config
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      file_ignore_patterns = {
        "node_modules",
        ".git",
        ".venv",
        "__pycache__",
        ".pytest_cache",
        ".mypy_cache",
        "target",
        "dist",
        "build",
      },
    })

    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      find_files = {
        hidden = true,
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".venv",
          "__pycache__",
        },
      },
      live_grep = {
        file_ignore_patterns = {
          "node_modules",
          ".git",
          ".venv",
        },
        additional_args = function(_)
          return { "--hidden" }
        end,
      },
    })

    return opts
  end,
}


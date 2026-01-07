return {
  "saghen/blink.cmp",
  opts = {
    -- 1. Python Quality-of-Life: Auto-insert brackets for functions
    completion = {
      accept = { auto_brackets = { enabled = true } },
    },

    -- 2. C++ Intelli-Sorting
    -- Blink handles this much better automatically, 
    -- but we ensure the LSP source is prioritized.
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}

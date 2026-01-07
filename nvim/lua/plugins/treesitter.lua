return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      -- 🏗️ Core & UI
      "lua",
      "vim",
      "vimdoc",
      "markdown",
      "markdown_inline",
      "regex",
      "query",

      -- ☕ Java
      "java",
      "properties",

      -- 🐍 Python
      "python",
      "rst",
      "ninja",

      -- ⚙️ C / C++
      "c",
      "cpp",

      -- 🌐 Web Development
      "javascript",
      "typescript",
      "tsx",
      "jsx",
      "html",
      "css",
      "scss",

      -- 🦀 Systems & Backend
      "go",
      "rust",

      -- 🐳 DevOps & Infrastructure
      "dockerfile",
      "hcl",
      "terraform",
      "make",

      -- 📄 Config & Data
      "json",
      "jsonc",
      "yaml",
      "toml",
      "xml",
      "bash",
    },
  },
}
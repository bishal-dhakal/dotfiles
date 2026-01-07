return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- 🛠️ Core / Editor Tools
      "stylua",
      "shellcheck",
      "shfmt",
      "sql-formatter",

      -- ☕ Java
      "jdtls",
      "java-debug-adapter",
      "java-test",

      -- 🐍 Python
      "pyright",
      "ruff",

      -- ⚙️ C / C++
      "clangd",
      "codelldb",

      -- 🌐 Web Development
      "typescript-language-server",
      "html-lsp",
      "css-lsp",
      "json-lsp",
      "prettier",
      "prettierd",
      "eslint_d",

      -- 🦀 Systems & Backend
      "gopls",
      "rust-analyzer",
      "gofumpt",

      -- 🐳 DevOps & Infrastructure
      "terraform-ls",
      "hadolint",
      "checkmake",

      -- 📄 Config / Dev Environment
      "lua-language-server",
      "yaml-language-server",
      "marksman",
      "taplo",
      "lemminx",
    },
  },
}

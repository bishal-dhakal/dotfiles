-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Enhanced visual selection highlighting
vim.api.nvim_create_autocmd("ModeChanged", {
  pattern = { "n:*", "v:*" },
  group = vim.api.nvim_create_augroup("visual_selection", { clear = true }),
  callback = function()
    -- Improve visual mode highlighting
    if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "" then
      vim.opt.cursorline = true
    end
  end,
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 📏 Language-specific Indentation & Conventions
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    -- 4 spaces (Python, Java, C/C++, Rust)
    "python",
    "java",
    "c",
    "cpp",
    "rust",
    -- 2 spaces (default for web, config files)
    "javascript",
    "typescript",
    "tsx",
    "jsx",
    "html",
    "css",
    "scss",
    "json",
    "yaml",
    "toml",
    "xml",
    "markdown",
    -- Tabs (Go convention)
    "go",
  },
  callback = function()
    local ft = vim.bo.filetype
    if ft == "go" then
      -- Go uses tabs
      vim.opt_local.expandtab = false
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
    elseif vim.tbl_contains({ "python", "java", "c", "cpp", "rust" }, ft) then
      -- 4 spaces for Python, Java, C/C++, Rust
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
    else
      -- 2 spaces for web and config files
      vim.opt_local.expandtab = true
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    end
  end,
})

-- 📏 Visual line length guides (formatters handle actual wrapping)
-- These are just visual aids - formatters (ruff, google-java-format, rustfmt) handle the actual line length
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python", "java", "rust" },
  callback = function()
    local ft = vim.bo.filetype
    if ft == "python" then
      vim.opt_local.colorcolumn = "88" -- Black formatter default
    elseif ft == "java" then
      vim.opt_local.colorcolumn = "100" -- Google Java Style Guide
    elseif ft == "rust" then
      vim.opt_local.colorcolumn = "100" -- rustfmt default
    end
  end,
})

-- 🧹 Auto-remove trailing whitespace on save (except for markdown)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*" },
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "markdown" and ft ~= "" then
      vim.cmd([[%s/\s\+$//e]])
    end
  end,
})


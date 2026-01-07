# Neovim Configuration

A clean, modular Neovim configuration built on [LazyVim](https://github.com/LazyVim/LazyVim).

## 📁 Structure

```
nvim/
├── init.lua                 # Entry point - bootstraps lazy.nvim
├── lua/
│   ├── config/              # Core configuration
│   │   ├── autocmds.lua     # Autocommands (yank highlight, filetype indentation)
│   │   ├── keymaps.lua     # Custom keymaps (LazyVim handles defaults)
│   │   ├── lazy.lua        # LazyVim plugin manager setup
│   │   └── options.lua     # Neovim options (UI, search, formatting, etc.)
│   └── plugins/             # Plugin configurations
│       ├── lang/           # Language-specific plugins (non-LSP)
│       │   ├── cpp.lua     # C++ specific plugins
│       │   ├── java.lua    # Java setup (jdtls, debug adapter, test runner)
│       │   └── python.lua  # Python specific plugins (venv-selector)
│       ├── blink.lua       # Completion engine (blink.cmp)
│       ├── colorscheme.lua # Colorscheme (kanagawa)
│       ├── lsp.lua         # LSP server configurations (lua_ls, pyright, clangd)
│       ├── mason.lua        # Mason package manager (LSP servers, formatters, debuggers)
│       ├── misc.lua         # Miscellaneous small plugins
│       ├── nvim-dap.lua    # Debug Adapter Protocol setup
│       └── treesitter.lua  # Treesitter parsers
└── README.md               # This file
```

## 🎯 Design Principles

- **Modular**: Each plugin/feature in its own file
- **Scalable**: Easy to add new languages or plugins
- **Consistent**: Clear separation between LSP configs and language-specific plugins
- **Maintainable**: Self-documenting structure

## 🔧 Key Features

### Language Support
- **Java**: jdtls, Java debug adapter, test runner
- **Python**: pyright, ruff, venv-selector
- **C/C++**: clangd with enhanced options
- **Lua**: lua_ls with custom settings

### Core Tools
- **LSP**: Centralized in `lua/plugins/lsp.lua`
- **Mason**: Automatic installation of LSP servers and tools
- **Treesitter**: Syntax highlighting and parsing
- **DAP**: Debugging support with UI
- **Completion**: blink.cmp with auto-brackets

## 📝 Adding New Languages

1. **Add LSP server** to `lua/plugins/lsp.lua`:
   ```lua
   servers = {
     your_lsp = {
       settings = { ... }
     }
   }
   ```

2. **Add Mason package** to `lua/plugins/mason.lua`:
   ```lua
   ensure_installed = {
     "your-lsp-server",
   }
   ```

3. **Add Treesitter parser** to `lua/plugins/treesitter.lua`:
   ```lua
   ensure_installed = {
     "your-language",
   }
   ```

4. **Add language-specific plugins** (optional) to `lua/plugins/lang/yourlang.lua`:
   ```lua
   return {
     -- Non-LSP plugins specific to this language
   }
   ```

## 🚀 Getting Started

1. Clone this repository to `~/.config/nvim/`
2. Open Neovim - LazyVim will auto-install plugins
3. Mason will auto-install LSP servers on first use

## 📚 Resources

- [LazyVim Documentation](https://lazyvim.github.io/)
- [LazyVim Keymaps](https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua)

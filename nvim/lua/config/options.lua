-- 🎯 Professional DX Settings
vim.opt.relativenumber = true 
vim.opt.scrolloff = 8         
vim.opt.cursorline = true     
vim.opt.mouse = "a"

-- 👁️ Visual Selection Enhancements
vim.opt.showmode = true -- Show current mode
vim.opt.cursorcolumn = false -- Don't highlight entire column (performance)           

-- 📋 Clipboard & Undo
vim.opt.clipboard = "unnamedplus" 
vim.opt.undofile = true            

-- 🔍 Search Behavior
vim.opt.ignorecase = true 
vim.opt.smartcase = true  
vim.opt.hlsearch = true   

-- ⚡ Performance
vim.opt.updatetime = 250 
vim.opt.timeoutlen = 300 

-- 📏 Formatting
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true

-- 🪟 Windows / Splits
vim.opt.splitright = true 
vim.opt.splitbelow = true

vim.opt.cmdheight = 2 -- +1 row above tmux vs default

-- 📝 File Formatting
vim.opt.fixendofline = true -- Ensure files end with newline (POSIX standard) 

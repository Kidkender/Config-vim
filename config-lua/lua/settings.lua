local g = vim.g
local o = vim.o
local cmd = vim.cmd

-- Encoding
vim.scriptencoding = "utf-8"

-- Leader keys
g.mapleader = " "
g.maplocalleader = " "

-- Editor options
o.compatible = false  -- 'nocompatible' is not a valid option in Lua
o.showmatch = true
o.showcmd = true
o.ignorecase = true
o.hlsearch = true
o.incsearch = true
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true
o.shiftwidth = 4
o.autoindent = true  -- Added missing = true
o.number = true
o.wildmode = "longest,list"  -- Added quotes and proper spacing
o.colorcolumn = "80"  -- Correct alternative for 'set cc=80'
o.foldmethod = "syntax"  -- Added proper spacing
o.mouse = "a"
o.clipboard = "unnamedplus"  -- Added quotes
o.cursorline = true
o.ttyfast = true
o.termguicolors = true
o.spell = false
-- o.relativenumber = true
o.title = true
o.ttimeoutlen = 0
o.wildmenu = true
o.inccommand = "split" 
o.splitbelow = true
o.encoding = "utf-8"
o.hidden = true

-- Filetype handling (must use vim.cmd for this)
cmd([[
  filetype plugin on
  syntax on
]])

-- Disable swap file (uncomment if needed)
-- o.swapfile = false

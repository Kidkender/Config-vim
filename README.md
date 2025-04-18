﻿# 🌟 Neovim Config - Personal Setup

This repository contains my **Neovim configuration**, supporting **two different setup options**:

## 🔧 Configuration Options

### 1. `init.vim` (Vimscript-based)

- Config file: `init.vim`
- Suitable for users who prefer the classic Vim-style configuration.

### 2. `init.lua` (Lua-based)

- Config file: `config-lua/init.lua`
- Modern and modular structure using Lua.
- Contains a `lua/` directory with separate config modules for plugins, keymaps, settings, etc.

> 📌 **Requires Neovim version 0.10+**

---

## 📁 Key Lua Modules (`config-lua/lua/configs`)

| File             | Description                                           |
| ---------------- | ----------------------------------------------------- |
| `cmp.lua`        | Completion setup using `nvim-cmp`                     |
| `gitsigns.lua`   | Git diff signs in the signcolumn                      |
| `kanagawa.lua`   | Kanagawa colorscheme setup                            |
| `lsp.lua`        | LSP configuration using `nvim-lspconfig`              |
| `mason-lsp.lua`  | Manage LSP servers with `mason.nvim`                  |
| `lualine.lua`    | Statusline configuration using `lualine.nvim`         |
| `neo-tree.lua`   | File explorer powered by `neo-tree.nvim`              |
| `null-ls.lua`    | Formatter and linter integration using `null-ls`      |
| `telescope.lua`  | Fuzzy finder setup with `telescope.nvim`              |
| `toggleterm.lua` | Integrated terminal with `toggleterm.nvim`            |
| `treesitter.lua` | Syntax highlighting and parsing via `nvim-treesitter` |

---

## 🎮 Plugins & Keymaps

Both configuration options (`init.vim` and `init.lua`) use similar plugin setups and key mappings to ensure a consistent experience across both styles.

---

## 🚀 Getting Started

1. Clone the repo:

   ```bash
   git clone https://github.com/kidkender/Config-vim ~/.config/nvim
   ```

2. Choose your preferred config style:
   - For Vimscript: copy `init.vim` to `~/.config/nvim/init.vim`
   - For Lua: use the `config-lua/` directory as your Neovim config (`~/.config/nvim/`)

---

## 📬 Feedback & Contributions

Feel free to open an issue or submit a PR if you have suggestions or improvements!

---

Happy hacking! 🧠⚡

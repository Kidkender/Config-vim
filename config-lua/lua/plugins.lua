return {

    { "folke/lazy.nvim", version = "*" },
    
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000, 
        config = function()
            vim.cmd.colorscheme("kanagawa")
            require("kanagawa").setup(require("configs.kanagawa"))
        end,
    },
    
    -- Icons
    { "nvim-tree/nvim-web-devicons", lazy = true },
    
    -- Statusline
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",  -- Optimize than BufEnter
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
        -- Auto update theme when change colorscheme
        vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          require("lualine").setup(require("configs.lualine"))
        end
      })
      
      require("lualine").setup(require("configs.lualine"))
    end
   },

  -- LSP
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("configs.lsp")
        end  

    },


    -- cmp: Autocomplete
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
            require("configs.cmp")
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = {"BufReadPost", "BufNewFile"},
        config = function()
            require("configs.treesitter")
        end,
    },

    -- LSP diagnostics, code actions, and more via Lua.
     {
        "jose-elias-alvarez/null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "williamboman/mason.nvim", -- Recommended for installing null-ls binaries
        },
        config = function()
            require("configs.null-ls")
        end,
    },

    -- Mason: Portable package manager
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.mason-lsp")
        end,
    },

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("configs.toggleterm")
        end,
    },
    
    -- hrsh7th
    { "hrsh7th/vim-vsnip"},
    { "hrsh7th/vim-vsnip-integ"},
    { "hrsh7th/cmp-path"},
    { "hrsh7th/cmp-buffer"},

}

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

    -- Neotree
    {
      "nvim-neo-tree/neo-tree.nvim",
      dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
      deactivate = function()
        vim.cmd([[Neotree close]])
      end,
      init = function()
        vim.api.nvim_create_autocmd("BufEnter", {
          group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
          desc = "Start Neo-tree with directory",
          once = true,
          callback = function()
            if package.loaded["neo-tree"] then
              return
            else
              local stats = vim.uv.fs_stat(vim.fn.argv(0))
              if stats and stats.type == "directory" then
                require("neo-tree")
                vim.cmd("Neotree show")
              end
            end
          end,
        })
      end,
      config = function(_, opts) 
        require("configs.neo-tree")(opts)
      end,
    },
    -- Telescope
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",  
      },
      config = function() 
        require("configs.telescope")
      end,
    },

    --Luasnip
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
          end,
        },
      },
      opts = {
        history = true,
        delete_check_events = "TextChanged",
      },
    },

    -- Git
    {
      "lewis6991/gitsigns.nvim",
      event = {"BufReadPre", "BufNewFile"},
      config = function()
        require("configs.gitsigns")
      end,
    },

    {
      "kdheepak/lazygit.nvim",
      lazy = true,
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    }
    


}

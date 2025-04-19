return {
    highlight = {
        enable = true,
        disable = function(lang, buf) 
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },

     -- Auto-install parsers
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "html",
      "css",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "yaml",
      "rust",
      "c_sharp",
      "toml",
      "markdown",
      "markdown_inline",
      "go", 
      "gomod", 
      "gowork", 
      "gosum"
    },

     -- Advanced features
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
     indent = {
      enable = true,
      disable = { "python", "yaml" }
    },

    context_commentstring = {
      enable = true,
      enable_autocmd = false,
      config = {
        javascriptreact = { __default = '// %s', jsx_element = '{/* %s */}' }
      }
    },
    autotag = {
      enable = true,
      filetypes = {
        "html", "javascript", "typescript", "javascriptreact",
        "typescriptreact", "tsx", "jsx", "markdown"
      }
    },
    rainbow = {
      enable = true,
      disable = { "html" },
      extended_mode = false,
      max_file_lines = 1000,
      colors = {
        "#cc241d",
        "#a89984",
        "#b16286",
        "#d79921",
        "#689d6a",
        "#d65d0e",
        "#458588",
      },
    }
}

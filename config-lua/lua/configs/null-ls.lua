-- lua/configs/null-ls.lua
return function()
  local ok, null_ls = pcall(require, "null-ls")
  if not ok then
    vim.notify("null-ls not found!", vim.log.levels.WARN)
    return
  end

  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions

  -- Configure sources
  null_ls.setup({
    debug = false,
    sources = {
      -- Formatting
      formatting.prettierd.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "markdown",
          "graphql",
          "handlebars",
        },
      }),
      formatting.stylua.with({
        extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
      }),
      formatting.rustfmt,
      formatting.black.with({ extra_args = { "--fast" } }),
      formatting.isort,

      -- Diagnostics
      diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
        end,
      }),
      diagnostics.shellcheck,
      diagnostics.pylint,

      -- Code Actions
      code_actions.eslint_d,
      code_actions.shellcheck,
      code_actions.gitsigns,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("LspFormatting", { clear = false }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({
              filter = function(client)
                -- Only use null-ls for formatting
                return client.name == "null-ls"
              end,
              async = false,
            })
          end,
        })
      end
    end,
  })
end

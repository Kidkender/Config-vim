-- lua/configs/lsp.lua
local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")


local servers = {
  "ts_ls",  -- The new package name  
  "cssls",
  "tailwindcss",
  -- Add more servers here
}

-- Enhanced on_attach function
local on_attach = function(client, bufnr)
  -- Enable format on save
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({
          filter = function(c)
            return c.name ~= "tsserver" -- Let prettier handle TS/JS formatting
          end,
          timeout_ms = 3000,
        })
      end,
    })
  end

  -- Enable keymaps only for the active buffer
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- Enhanced capabilities with nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- Configure Mason to automatically install LSP servers
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true, -- Auto-install missing servers
})

-- Setup each LSP server
for _, server in ipairs(servers) do
  lspconfig[server].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    -- Server-specific settings
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            "tw`([^`]*)",
            "tw=\"([^\"]*)",
            "tw={\"([^\"}]*)",
            "tw\\.\\w+`([^`]*)",
            "tw\\(.*?\\)`([^`]*)",
          },
        }
      },
      typescript = {
        format = false -- Let prettier handle formatting
      },
      css = {
        validate = true
      }
    }
  })
end

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

-- Customize diagnostic signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

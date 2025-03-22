-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
return {
  clangd = {},
  rust_analyzer = {},
  pyright = {},
  ts_ls = {},
  nim_langserver = {},
  gopls = {},
  clojure_lsp = {},
  groovyls = {},
  yamlls = {},
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  stylua = {},
  prettierd = {},
}


-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
return {
  clangd = {},
  rust_analyzer = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'workspace',
          indexing = true,
        },
      },
    },
  },
  ruff = {},
  ts_ls = {},
  gopls = {},
  clojure_lsp = {
    filetypes = { 'clojure' }, -- .edn files map to 'clojure' via vim.filetype.add
  },
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
        diagnostics = {
          globals = { 'vim' },
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  stylua = {},
  prettierd = {},
  tflint = {},
  marksman = {},
  kotlin_lsp = {},
}


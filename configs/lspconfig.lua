local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- ! for graphql I also had to execute: TSInstall graphql to get treesitter to download
-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "ruff_lsp", "graphql" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.solidity.setup {
  -- !!! ------------- !!!
  -- if you miss adding the on_attach and capabilties here, lsp features like
  -- go to definition, or inspecting diagnostic messages will **NOT** work!!
  on_attach = on_attach,
  capabilities = capabilities,
  -- !!! ------------- !!!
  cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = lspconfig.util.find_git_ancestor,
  single_file_support = true,
}

--
-- lspconfig.pyright.setup { blabla}

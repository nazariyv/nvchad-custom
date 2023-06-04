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

-- Solidity LSPConfig will be weird until nomic foundation sls is merged into nvim-lspconfig
local utils = require("core.utils")
local solidity_on_attach = function(client, bufnr)
  -- this changes the original on attach to allow document formatting
  utils.load_mappings("lspconfig", { buffer = bufnr })
  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
  if not utils.load_config().ui.lsp_semantic_tokens then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

lspconfig.solidity.setup {
  -- !!! ------------- !!!
  -- if you miss adding the on_attach and capabilties here, lsp features like
  -- go to definition, or inspecting diagnostic messages will **NOT** work!!
  on_attach = solidity_on_attach,
  capabilities = capabilities,
  -- !!! ------------- !!!
  cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
  filetypes = { "solidity" },
  root_dir = lspconfig.util.find_git_ancestor,
  single_file_support = true,
}

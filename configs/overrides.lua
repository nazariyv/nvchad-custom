local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "rust",
    "solidity",
    "graphql",
    "yaml",
    "toml",
    "terraform",
    "sql",
    "regex",
    "json",
    "http",
    "html",
    "go",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "diff",
    "dockerfile",
    "css",
    "bash"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- python
    "pyright",
    -- ! it's the responsibility of python project you are working in to add
    -- ! mypy with whatever other stubs / extensions / configs in mypy.ini
    -- ! and point null-ls to it in mypy.ini with the following line:
    -- python_executable = .venv/bin/python
    -- "mypy",
    "ruff",
    "ruff-lsp",
    "black",
    "debugpy",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust
    "rust-analyzer",

    -- solidity
    "nomicfoundation-solidity-language-server",

    -- graphql
    "graphql-language-service-cli",

    "bash-language-server",
    "json-lsp",

    "shellcheck",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M

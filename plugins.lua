local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    -- enabled = false
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    -- TODO: causing some issues sometimes
    -- init = function()
    --   vim.g.rustfmt_autosave = 1
    -- end,
  },

  -- I literally had to go into: /home/shredder/.local/share/nvim/lazy/markdown-preview.nvim
  -- and `yarn install`. There is some problem with this plugin right now
  -- also see: https://github.com/iamcco/markdown-preview.nvim/issues/188
  -- I saw the debug message by going `:messages` in nvim
  {
    "iamcco/markdown-preview.nvim",
    lazy = false,
    run = "cd app & yarn install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}

return plugins

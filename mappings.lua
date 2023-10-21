---@type MappingsTable
local M = {}

M.general = {
  n = {

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "when moving page down center" },
    ["<C-u>"] = { "<C-u>zz", "when moving page up center" },
    ["<leader>y"] = { '"+y', "yanks into +" },
    ["<leader>Y"] = { '"+Y', "yanks into +" },
    ["<leader>d"] = { '"_d', "delete into void" },
    ["<leader>f"] = { vim.lsp.buf.format, "format" },
    ["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "replace all words" },
    ["<leader>qq"] = { ":wqa<CR>", "write and close all" },

    ["n"] = { "nzzzv", "allows search tersm to stay in the middle" },
    ["N"] = { "Nzzzv", "allows search terms to stay in the middle" },

    -- for tmux navigator
    ["<C-h>"] = { " <cmd> TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { " <cmd> TmuxNavigateRight<CR>", "window right" },
    ["<C-j>"] = { " <cmd> TmuxNavigateDown<CR>", "window down" },
    ["<C-k>"] = { " <cmd> TmuxNavigateUp<CR>", "window up" },

    -- zenmode
    ["<leader>z"] = { " <cmd> ZenMode<CR>", "engage zen mode" },

    -- undotree
    ["<leader>u"] = { " <cmd> UndotreeShow<CR>", "show undotree" },

    -- prime's maps
    -- TODO: for another day when I reserach `tmux-sessionizer`
    -- ["<C-f>"] = { " <cmd> silent !tmux neww tmux-sessionizer<CR>" },
    -- quickfix & loclist navigation
    ["<A-k>"] = { " <cmd> cnext<CR>zz" },
    ["<A-j>"] = { " <cmd> cprev<CR>zz" },
    ["<leader>k"] = { " <cmd> lnext<CR>zz" },
    ["<leader>j"] = { " <cmd> lprev<CR>zz" },
  },

  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move block down" },
    ["<leader>y"] = { '"+y', "yanks into +" },
    ["<leader>d"] = { '"_d', "delete into void" },

    -- stay in visual mode after shifting block of code with > or <
    ["<"] = { "<gv", "shift left and keep visual mode" },
    [">"] = { ">gv", "shift right and keep visual mode" },
  },
  x = {
    ["<leader>p"] = { '"_dP', "copying trick from prime" },
  },
  i = {
    ["<C-c>"] = { "<Esc>", "leave insert mode in style. prime's favourite" },
  },
}

-- more keybinds!
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "update crates",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    -- default for this is U.
    -- but it takes me to the beginning of the line, insteaf of toggling
    ["th"] = {
      function()
        local api = require "nvim-tree.api"
        api.tree.toggle_hidden_filter()
      end,
    },
  },
}

return M

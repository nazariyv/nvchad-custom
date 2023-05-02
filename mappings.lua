---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "when moving page down center" },
    ["<C-u>"] = { "<C-u>zz", "when moving page up center" },
    ["<leader>y"] = { '\"+y', "yanks into +" },
    ["<leader>Y"] = { '\"+Y', "yanks into +" },
    ["<leader>d"] = { '\"_d', "delete into void" },
    ["<leader>f"] = { vim.lsp.buf.format, "format" },
    ["<leader>qq"] = { ':wqa<CR>', "write and close all" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "move block down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "move block down" },
    ["<leader>y"] = { '\"+y', "yanks into +" },
    ["<leader>d"] = { '\"_d', "delete into void" },
  },
  x = {
    ["<leader>p"] = { '\"_dP', "copying trick from prime" },
  }
}

-- more keybinds!

return M

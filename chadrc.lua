---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "solarized_dark",
  theme_toggle = { "solarized_dark", "solarized_dark_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  telescope = { style = "bordered" },

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "arrow",
    overriden_modules = function(modules)
      local fn = vim.fn
      local sep = "%#St_file_sep#"
      local str = modules[2]
      local parts = {}
      for match in (str .. sep):gmatch("(.-)" .. sep) do
        table.insert(parts, match)
      end

      local new_sep_r = string.gsub(parts[2], "%%", "")
      local icon = "？"
      local filename = (fn.expand "%" == "" and "Empty ") or fn.expand "%:t"
      local foldername = (fn.expand "%:p:h" == "" and "Empty") or fn.expand "%:p:h:t"

      local modifier_indicator = ""
      if vim.bo.modified then
        modifier_indicator = " •"
      end

      if filename ~= "Empty" then
        local devicons_present, devicons = pcall(require, "nvim-web-devicons")

        if devicons_present then
          local ft_icon = devicons.get_icon(filename)
          icon = (ft_icon ~= nil and " " .. ft_icon) or ""
        end

        filename = " " .. foldername .. "/" .. filename .. modifier_indicator .. " "
      end

      local out = "%#St_file_info#" .. icon .. filename .. "%#St_file_sep#" .. new_sep_r
      modules[2] = out
    end,
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M

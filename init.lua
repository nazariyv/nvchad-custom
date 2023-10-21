-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local vo = vim.opt

vo.guicursor = ""

vo.nu = true
vo.relativenumber = true

vo.tabstop = 4
vo.softtabstop = 4
vo.shiftwidth = 4
vo.expandtab = true

vo.smartindent = true

vo.wrap = false

vo.swapfile = false
vo.backup = false
vo.undodir = os.getenv("HOME") .. "/.vim/undodir"
vo.undofile = true

vo.hlsearch = false
vo.incsearch = true

vo.termguicolors = true

vo.scrolloff = 8
vo.signcolumn = "yes"
vo.isfname:append("@-@")

vo.updatetime = 50

vo.colorcolumn = "80"

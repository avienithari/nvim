local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- page scroll
opt.scrolloff = 8

-- right line
opt.colorcolumn = "80"
opt.signcolumn = "yes"

-- search
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.undodir = string.format("%s/undodir", vim.fn.stdpath("cache"))
opt.undofile = true

opt.swapfile = false

vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "x", '"_x')

keymap.set("c", "W", "w<CR>")

keymap.set("n", "<leader>h", vim.cmd.nohlsearch, opts) -- clear highlights

keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", { noremap = true, silent = true }) -- open Lazy
keymap.set("n", "<leader>M", "<cmd>Mason<CR>") -- open Mason

keymap.set("n", "<leader>g", "<cmd>Git<CR>", { noremap = true, silent = true }) -- open Fugitive

-- window keymaps
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- keep cursor at the middle of the page
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- move lines
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- better pasting
keymap.set("x", "<leader>p", '"_dP')

-- tab keymaps
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- maximize tab
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle nvimtree
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>u", ":UndotreeToggle<CR>") -- toggle Undotree

vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.o.clipboard = unnamedplus
vim.o.go = a
vim.o.mouse = a
vim.o.laststatus = 0
vim.o.relativenumber = true
vim.o.noruler = true
vim.o.noshowcmd = true
vim.o.nohlsearch = true
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "<leader>qq", ":q!<CR>")
vim.keymap.set("n", "<leader>wq", ":wq<CR>")
vim.keymap.set("n", "<C-s>s", ":LiveServerStart<CR>")
vim.keymap.set("n", "<C-s>x", ":LiveServerStop<CR>")
vim.keymap.set("n", "<F12>", ":set spell!<CR>")
vim.keymap.set("n", "<F11>", ":set spelllang=en_us<CR>")
vim.keymap.set("n", "<F10>", ":set spelllang=pt_br<CR>")

vim.opt.spelllang = 'en_us'
vim.opt.spell = true


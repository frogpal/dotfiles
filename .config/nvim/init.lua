require("config.lazy")

vim.cmd.colorscheme "catppuccin-mocha"
vim.wo.relativenumber = true
vim.o.laststatus = 3

vim.keymap.set('n', '<Leader>l', '<cmd>Lazy<Cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<Leader>cm', '<cmd>Mason<CR>', { desc = 'Open Mason' })

-- vim.opt.clipboard "unnamedplus"
vim.o.clipboard = "unnamedplus" 
-- When yanking something, I don't get that haptic feedback / highlight effect 
-- like in LazyVim. Look it up.
vim.o.wrap = false -- Display lines as one uninterrupted long line
vim.o.linebreak = true -- Prevent splitting words at the end of the line

vim.cmd([[
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
]])

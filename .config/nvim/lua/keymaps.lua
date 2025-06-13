vim.keymap.set("n", "<leader>so", "<CMD>source%<CR>", { desc = "Source file" })
-- vim.keymap.set("n", "<leader>e", "<CMD>Lex<CR>", { desc = "Netrw"})

-- Buffers
vim.keymap.set("n", "<leader>bn", "<CMD>bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<CMD>bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "Delete current buffer" })

vim.keymap.set("n", "<S-h>", "<CMD>tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<S-l>", "<CMD>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("i", "<C-BS>", "<C-W>", { desc = "Delete previous word" })

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set("n", "<Leader>l", "<cmd>Lazy<Cr>", { desc = "Open Lazy" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear highlights" })

-- vim.keymap.set("n", "<leader>f", function()
-- 	vim.lsp.buf.format()
-- end, { desc = "Format file" })
--
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- TODO add to autocommand or vimtex keys config
vim.keymap.set("n", "<F2>", "<cmd>VimtexTocToggle<CR>", { desc = "Toggle Vimtex TOC", silent = true })

-- Vim-tmux-runner
vim.keymap.set("n", "<F1>", "<cmd>VtrSendFile!<CR>", { desc = "Run File", noremap = true, silent = true })
vim.keymap.set("n", "<leader>kr", "<cmd>VtrKillRunner<CR>", { desc = "Kill Runner", silent = true })

-- LSP
vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
end, { silent = true })
vim.keymap.set("n", "<C-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
end, { silent = true })
vim.keymap.set("n", "<leader>cr", function()
    vim.lsp.buf.rename()
end, { desc = "Rename", silent = true })
vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
end, { desc = "Code Action" })

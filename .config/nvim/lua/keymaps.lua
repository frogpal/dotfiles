local km = vim.keymap

-- Lazy
km.set("n", "<Leader>l", "<cmd>Lazy<Cr>", { desc = "Open Lazy" })

-- Source file
-- TODO add this to only .lua, .vim, .zshrc, .conf files (and maybe others?)
km.set("n", "<leader>so", "<cmd>source%<cr>", { desc = "Source file" })

-- Buffers vim.keymap.set("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
km.set("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
km.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })

km.set("n", "<S-h>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
km.set("n", "<S-l>", "<cmd>tabnext<cr>", { desc = "Next tab" })
km.set("i", "<C-BS>", "<C-W>", { desc = "Delete previous word" })

-- Clear highlights on search when pressing <Esc> in normal mode
km.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlights" })

km.set("v", "<", "<gv", { desc = "Indent Left" })
km.set("v", ">", ">gv", { desc = "Indent Right" })

km.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
km.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
km.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up  ", expr = true, silent = true })
km.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up  ", expr = true, silent = true })

-- LSP
km.set("n", "K", function()
    vim.lsp.buf.hover({ border = "rounded" })
end, { silent = true })
-- vim.keymap.set("n", "<C-k>", function()
--     vim.lsp.buf.signature_help({ border = "rounded" })
-- end, { silent = true })
km.set("n", "<leader>cr", function()
    vim.lsp.buf.rename()
end, { desc = "Rename", silent = true })
km.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
end, { desc = "Code Action" })

km.set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split vertically  ", silent = true })
km.set("n", "<leader>sh", "<cmd>split<cr> ", { desc = "Split horizontally", silent = true })

km.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
km.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
km.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width " })
km.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width " })

local ok, fzf = pcall(require, "fzf-lua")
if not (ok and fzf) then
    return
end

-- Git keymaps

km.set("n", "<leader>gf", fzf.git_files, { desc = "Git Files" })
km.set("n", "<leader>gc", fzf.git_bcommits, { desc = "Browse File Commits" })
km.set("n", "<leader>gs", fzf.git_status, { desc = "Git Status" })
km.set("n", "<leader>gb", fzf.git_branches, { desc = "Git Branches" })

-- Replaced with tmux popup
-- if vim.fn.executable("lazygit") == 1 then
--     km.set("n", "<leader>gg", function()
--         Snacks.lazygit()
--     end, { desc = "Lazygit" })
-- end

-- Search

km.set("n", "<leader>sk", fzf.keymaps, { desc = "Search Keymaps" })
km.set("n", "<leader>ff", fzf.files, { desc = "Fzf Files" })
km.set("n", "<leader>,", fzf.buffers, { desc = "switch Buffer" })

km.set("n", "<leader>fc", function()
    fzf.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config Files" })

km.set("n", "<leader>fr", fzf.oldfiles, { desc = "Find Recent Files" })
km.set("n", "<leader>/", fzf.live_grep, { desc = "FZF Grep" })

-- LSP

km.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "Search Diagnostics" })
km.set("n", "<leader>ss", fzf.lsp_document_symbols, { desc = "Search Document Symbols" })
km.set("n", "<leader>ca", fzf.lsp_code_actions, { desc = "LSP Code Actions" })
km.set("n", "gd", fzf.lsp_definitions, { desc = "Go to Definition" })
km.set("n", "gr", fzf.lsp_references, { desc = "References" })

-- Misc

km.set("n", "<leader>j", fzf.helptags, { desc = "Help Tags" })
km.set("n", "<leader>pc", fzf.colorschemes, { desc = "Pick Colorscheme" })

km.set("n", "<leader>cm", "<cmd>Mason<cr>", { desc = "Mason" })

-- Search within selection. Taken from https://www.reddit.com/r/neovim/comments/1kv7som/search_within_selection_in_neovim/
km.set("x", "z/", "<C-\\><C-n>`</\\%V", { desc = "Search forward within visual selection" })
km.set("x", "z?", "<C-\\><C-n>`>?\\%V", { desc = "Search backward within visual selection" })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Map CTRL+v to paste from clipboard
keymap.set("n", "<C-v>", '"+p', opts)
keymap.set("i", "<C-v>", "<C-r>+", opts)
keymap.set("v", "<C-v>", '"+p', opts)

-- VimTex
keymap.set("n", "<F2>", ":VimtexTocToggle<CR>", opts)

--Remap ctrl + backspace to delete word in insert mode
keymap.set("i", "<C-BS>", "<C-w>", opts)

-- Neo-Tree
-- keymap.set("n", "<C-Tab>", "<cmd>Neotree focus<CR>")

-- Buffers
keymap.set("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Dashboard
keymap.set("n", "<F1>", "<cmd>Dashboard<CR>", opts)

-- Navigate vim panes
keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- vim-tmux-navigator
keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap.set("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap.set("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-- vim-test
keymap.set("n", "<leader>t", ":TestNearest<CR>", opts)
keymap.set("n", "<leader>T", ":TestFile<CR>", opts)
keymap.set("n", "<leader>a", ":TestSuite<CR>", opts)
-- keymap.set("n", "<leader>l", ":TestLast<CR>", opts)
keymap.set("n", "<leader>g", ":TestVisit<CR>", opts)

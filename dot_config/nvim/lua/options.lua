vim.wo.relativenumber = true
vim.opt.number = true
vim.o.laststatus = 3
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.o.clipboard = "unnamedplus"

-- Netrw settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_keepdir = 0
vim.g.netrw_liststyle = 3

-- Indentation settings
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.o.shiftround = true -- Round indent to nearest multiple
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.softtabstop = 4 -- Tab inserts 4 spaces
vim.opt.tabstop = 4 -- Visual width of tabs

vim.g.have_nerd_font = true

-- Display lines as one uninterrupted long line
vim.opt.wrap = false

-- Allows wrapped lines to have the same indent level as the first line
vim.opt.breakindent = true

-- Prevent splitting words at the end of the line
vim.opt.linebreak = true

-- save undo history
vim.opt.undofile = true
--
-- Case insensitive search unless you use \C or one more capital letter in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep the signcolumn on always by default
vim.opt.signcolumn = "yes"

-- Write to swap file after 250ms instead of 4000 after nothing is typed
vim.opt.updatetime = 250

-- Decrease timeout length of mappings from 1000 to 300
vim.opt.timeoutlen = 300

-- Open new splits to the right and below instead of to the left and above
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure how to display empty characters like tabs or spaces
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Confirm if you want to save a file or not after making changes and trying to exit
vim.opt.confirm = true

vim.opt.conceallevel = 2

-- Folding options
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99

-- Disable partially entered commands in the status line
vim.opt.showcmd = false

-- Display column line
vim.opt.colorcolumn = "120"

-- Maximum popup height
-- vim.opt.pumheight = 5

-- Disable unused default plugins
for _, plugin in pairs({
    -- "netrwFileHandlers",
    "2html_plugin",
    "spellfile_plugin",
    "matchit",
}) do
    vim.g["loaded_" .. plugin] = 1
end

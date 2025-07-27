-- Taken from https://www.reddit.com/r/neovim/comments/1lmkvgz/comment/n0886st/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
vim.cmd("hi clear")
local bg = "#000000"
local fg = "#00ff00"

for hl_group, attrs in pairs(vim.api.nvim_get_hl(0, {})) do
    if attrs.fg then
        attrs.fg = fg
    end
    if attrs.bg then
        attrs.bg = bg
    end
    vim.api.nvim_set_hl(0, hl_group, attrs)
end

vim.api.nvim_set_hl(0, "Visual", { bg = "#222222" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#002200" })

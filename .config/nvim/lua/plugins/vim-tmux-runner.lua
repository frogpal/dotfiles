return {
  "christoomey/vim-tmux-runner",
  lazy = false, -- Load plugin immediately
  init = function()
    vim.g.VtrStripLeadingWhitespace = 0
    vim.g.VtrClearEmptyLines = 0
    vim.g.VtrAppendNewline = 1
    vim.g.VtrPercentage = 25
  end,
}

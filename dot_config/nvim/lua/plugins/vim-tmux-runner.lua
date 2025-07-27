return {
    "christoomey/vim-tmux-runner",
    event = "BufReadPre",
    init = function()
        vim.g.VtrStripLeadingWhitespace = 0
        vim.g.VtrClearEmptyLines = 0
        vim.g.VtrAppendNewline = 1
        vim.g.VtrPercentage = 25
        vim.g.VtrFocusRunner = 0
    end,
    keys = {
        {
            "<F1>",
            "<cmd>VtrSendFile!<cr>",
            desc = "Run File",
            silent = true,
        },

        {
            "<leader>kr",
            "<cmd>VtrKillRunner<cr>",
            desc = "Kill Runner",
            silent = true,
        },
    },
}

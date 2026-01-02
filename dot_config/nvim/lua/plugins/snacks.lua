return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- bigfile = { enabled = true },
        dashboard = {
            enabled = false,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    {
                        icon = " ",
                        key = "z",
                        desc = "Chezmoi",
                        action = function()
                            require("fzf-lua").fzf_exec(
                                "chezmoi managed --path-style absolute --include files --exclude externals",
                                {
                                    previewer = "builtin",
                                    actions = require("fzf-lua").defaults.actions.files,
                                    fzf_opts = {
                                        ["--multi"] = true,
                                    },
                                }
                            )
                        end,
                    },
                    {
                        icon = "󰒲 ",
                        key = "L",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
        },
        quickfile = { enabled = true },
        words = { enabled = true },
    },
}

return {
    "roodolv/markdown-toggle.nvim",
    ft = "markdown",
    keys = {
        {
            "<M-q>",
            function()
                return require("markdown-toggle").quote_dot()
            end,
            expr = true,
            mode = "n",
        },
        {
            "<M-u>",
            function()
                return require("markdown-toggle").list_dot()
            end,
            expr = true,
            mode = "n",
        },
        {
            "<M-x>",
            function()
                return require("markdown-toggle").checkbox_dot()
            end,
            expr = true,
        },
        -- Other keymaps I'll probably set later
        --     {
        --         "<Leader><C-l>",
        --         function()
        --             return require("markdown-toggle").list_cycle_dot()
        --         end,
        --         expr = true,
        --         mode = "n",
        --     },
        --     {
        --         "<C-n>",
        --         function()
        --             return require("markdown-toggle").olist_dot()
        --         end,
        --         expr = true,
        --         mode = "n",
        --     },
        --     {
        --         "<M-x>",
        --         function()
        --             return require("markdown-toggle").checkbox_dot()
        --         end,
        --         expr = true,
        --         mode = "n",
        --     },
        --     {
        --         "<leader><m-x>",
        --         function()
        --             return require("markdown-toggle").checkbox_cycle_dot()
        --         end,
        --         expr = true,
        --         mode = "n",
        --     },
        --     {
        --         "<c-h>",
        --         function()
        --             return require("markdown-toggle").heading_dot()
        --         end,
        --         expr = true,
        --         mode = "n",
        --     },
        --
        --     -- visual mode with expr = false
        --     {
        --         "<c-q>",
        --         function()
        --             require("markdown-toggle").quote()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<c-l>",
        --         function()
        --             require("markdown-toggle").list()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<leader><c-l>",
        --         function()
        --             require("markdown-toggle").list_cycle()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<c-n>",
        --         function()
        --             require("markdown-toggle").olist()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<m-x>",
        --         function()
        --             require("markdown-toggle").checkbox()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<leader><m-x>",
        --         function()
        --             require("markdown-toggle").checkbox_cycle()
        --         end,
        --         mode = "x",
        --     },
        --     {
        --         "<c-h>",
        --         function()
        --             require("markdown-toggle").heading()
        --         end,
        --         mode = "x",
        --     },
    },
}

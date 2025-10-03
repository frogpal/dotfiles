return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    lazy = false,
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        winopts = {
            border = "single",
            -- backdrop = 0,
            preview = {
                border = "single",
            },
        },
    },
    config = function(_, opts)
        local fzf = require("fzf-lua")
        fzf.setup(opts)
        fzf.register_ui_select()
    end,
}

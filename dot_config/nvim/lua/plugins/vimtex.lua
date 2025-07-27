return {
    "lervag/vimtex",
    enabled = true,
    -- lazy = false, -- we don't want to lazy load VimTeX
    ft = "tex",
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = "extra",
            out_dir = "",
            callback = 1,
            continuous = 1,
            executable = "latexmk",
            hooks = {},
            options = {
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
        vim.g.vimtex_syntax_conceal = {
            accents = 0,
            ligatures = 0,
            cites = 0,
            fancy = 1,
            spacing = 0,
            greek = 1,
            math_bounds = 1,
            math_delimiters = 1,
            math_fracs = 1,
            math_super_sub = 1,
            math_symbols = 1,
            sections = 1,
            styles = 0,
        }
        vim.g.vimtex_toc_config = {
            show_help = 0,
            split_width = 40,
        }
        vim.g.vimtex_syntax_nospell_comments = 1
        -- vim.g.vimtex_complete_enabled = 1
        -- vim.g.vimtex_complete_close_braces = 1
    end,
}

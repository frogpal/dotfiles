return {
  "saghen/blink.cmp",
  dependencies = { "micangl/cmp-vimtex", "saghen/blink.compat" },
  opts = {
    sources = {
      compat = { "vimtex" },
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
    },
    keymap = {
      preset = "none",
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_and_accept" },
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },
    },
  },
}

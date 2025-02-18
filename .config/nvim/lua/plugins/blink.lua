return {
  "saghen/blink.cmp",
  dependencies = { "micangl/cmp-vimtex", "saghen/blink.compat", { "L3MON4D3/LuaSnip", version = "v2.*" } },
  opts = {
    sources = {
      compat = { "vimtex" },
      default = { "lsp", "path", "snippets" },
      transform_items = function(_, items)
        return vim.tbl_filter(function(item)
          -- return item.kind ~= require("blink.cmp.types").CompletionItemKind.Snippet
          --   and item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
          return item.kind ~= require("blink.cmp.types").CompletionItemKind.Text
        end, items)
      end,
    },
    keymap = {
      preset = "super-tab",
      -- ["<Up>"] = { "select_prev", "fallback" },
      -- ["<Down>"] = { "select_next", "fallback" },
      -- ["<Tab>"] = { "select_and_accept" },
      -- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      -- ["<C-e>"] = { "hide" },
    },
    completion = {
      ghost_text = {
        enabled = false,
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = false,
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
  },
}

return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "micangl/cmp-vimtex",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.completion = {
      completeopt = "menu,menuone,preview",
    }
    opts.sources = cmp.config.sources({
      { name = "vimtex" }, -- LaTeX completion
    })
    opts.mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping.confirm({ select = false }),
    })
    opts.auto_brackets = { "python" }
    opts.experimental = {
      ghost_text = false,
    }
  end,
}

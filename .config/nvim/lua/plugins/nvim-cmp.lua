return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "micangl/cmp-vimtex",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    -- Disable completion in comments
    opts.enabled = function()
      local disabled = false
      disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
      disabled = disabled or (vim.fn.reg_recording() ~= "")
      disabled = disabled or (vim.fn.reg_executing() ~= "")
      disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")
      return not disabled
    end

    opts.completion = {
      completeopt = "menu,menuone,noselect,",
    }
    opts.sources = cmp.config.sources({
      { name = "vimtex" },
      -- { name = "lazydev" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
    })
    opts.mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e"] = cmp.mapping.abort(),
      ["<Tab>"] = cmp.mapping.confirm({ select = false }),
      ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    })
    opts.experimental = {
      ghost_text = false,
    }
    -- opts.snippet = {
    --   expand = function(item)
    --     return LazyVim.cmp.expand(item.body)
    --   end,
    -- }
    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
      -- documentation = cmp.config.disable,
    }
  end,
}

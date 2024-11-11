return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      html = {
        settings = {
          html = {
            format = {
              enable = true, -- Enable formatting
              indentInnerHtml = true, -- Indent inside <style> and <script> tags
              templating = true, -- Enable templating for embedded JS/CSS
              wrapLineLength = 80,
              unformatted = "pre,code,textarea", -- Tags to exclude from formatting
            },
            hover = {
              documentation = true,
              references = true,
            },
            validate = {
              scripts = true, -- Validate <script> tags
              styles = true, -- Validate <style> tags
            },
            suggest = {
              html5 = true, -- Suggest HTML5 tags
            },
          },
        },
      },
    },
  },
}

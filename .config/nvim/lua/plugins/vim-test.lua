return {
  {
    "vim-test/vim-test",
    dependencies = { "preservim/vimux" },
    -- vim.cmd("let test#strategy = 'vimux'"),
    init = function()
      vim.cmd([[
        let test#strategy = "vimux"
      ]])
    end,
  },
}

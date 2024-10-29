return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  config = function()
    -- Set the mdformat command path
    vim.g.mdformat_command = "~/myenv/bin/mdformat"

    -- Setup markdown viewer plugin
    require("render-markdown").setup({})
  end,
}

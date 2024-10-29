-- FZF configuration
return {
  {
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim", -- FZF plugin for Neovim
  },
}

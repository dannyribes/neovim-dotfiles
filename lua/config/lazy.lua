local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Existing plugins here
    require("config.plugins.zenmode"),
    require("config.plugins.telescope"),
    require("config.plugins.treesitter"),
    require("config.plugins.lspconfig"),
    -- require("config.plugins.neo-tree"),
    require("config.plugins.oil"),
    require("config.plugins.colorscheme"),
    require("config.plugins.autocomplete"),
    require("config.plugins.autoformat"),
    require("config.plugins.dashboard"),
    "tpope/vim-sleuth", -- INFO: auto tab space
    require("config.plugins.mini"),
    -- require("config.plugins.markdown-viewer"),
    require("config.plugins.todo-comments"),
    require("config.plugins.harpoon"),
    require("config.plugins.lualine"),
    require("config.plugins.tailwind"),
    require("config.plugins.autoclose-tags"),
    require("config.plugins.autoclose-brackets"),
    require("config.plugins.multicursor"),
    -- plugin below is used for notifications, but has a lot of problems
    -- require("config.plugins.noice"),
    require("config.plugins.telescope-undo"),

    -- Add which-key.nvim plugin
    {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end,
    },

    -- Add the new tmux-navigator plugin
    require("config.plugins.tmux-navigator"),

    -- Add Nvim-Tree plugin
    {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons", -- Optional, for file icons
      },
      config = function()
        require("nvim-tree").setup({
          view = {
            width = 30,
            side = "left",
          },
          actions = {
            open_file = {
              quit_on_open = true, -- Closes the tree when you open a file
            },
          },
          renderer = {
            icons = {
              show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = true,
              },
            },
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
        })
      end,
    },
    -- Add FZF and FZF.vim plugin
    {
      "junegunn/fzf",
      run = function()
        vim.fn["fzf#install"]()
      end, -- Ensure FZF is installed
    },
    {
      "junegunn/fzf.vim", -- FZF plugin for Neovim
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})

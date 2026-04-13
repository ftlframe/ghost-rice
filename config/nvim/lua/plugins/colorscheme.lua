return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      highlight_groups = require("theme.highlights"),
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "rose-pine" },
  },
}

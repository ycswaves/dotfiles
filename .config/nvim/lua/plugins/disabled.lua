return {
  { "echasnovski/mini.surround", enabled = false },
  {
    "folke/flash.nvim",
    keys = {
      -- disable the default flash keymap
      { "s", mode = { "x", "o" }, false },
    },
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
  },
}

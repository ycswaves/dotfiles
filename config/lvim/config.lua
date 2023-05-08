--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  timeout = 10000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "tokyonight"
lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "mocha"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
vim.diagnostic.config({ virtual_text = false })

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

vim.g.fzf_layout = {
  window = {
    width = 0.85,
    height = 0.85
  }
}

lvim.keys.normal_mode = {
  -- Navigate buffers
  ["<S-Tab>"] = ":BufferLineCyclePrev<CR>",
  ["<Tab>"] = ":BufferLineCycleNext<CR>",
  -- find file
  ["<C-p>"] = ":Telescope find_files<CR>",
}

vim.cmd([[
  command! -bang -nargs=* Agi call fzf#vim#ag(<q-args>, '--ignore node_modules', fzf#vim#with_preview())
  nmap <C-f> :Agi <CR>
  nmap [q :cprevious <CR>
  nmap ]q :cnext <CR>
]])

lvim.builtin.which_key.mappings["ag"] = {
  "<cmd>call fzf#vim#ag(expand('<cword>'), '--ignore node_modules', fzf#vim#with_preview())<cr>",
  "Search under cursor" }
lvim.builtin.which_key.mappings["wa"] = { "<cmd>:wa<cr>", "Save all" }
lvim.builtin.which_key.mappings["ai"] = { "<cmd>:Copilot panel<cr>", "Copilot" }

lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.width = 0.8
lvim.builtin.telescope.defaults.layout_config.height = 0.8
lvim.builtin.telescope.defaults.layout_config.prompt_position = "top"



local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  { exe = "gofmt" },
  { exe = "eslint_d" },
  {
    exe = "prettierd",
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue", "svelte" }
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "vue" },
  },
}

lvim.plugins = {
  { "catppuccin/nvim",   name = "catppuccin" },
  -- {
  --   "sunjon/shade.nvim",
  --   config = function ()
  --     require('shade').setup({
  --       overlay_opacity = 70,
  --       opacity_step = 1,
  --     })
  --   end
  -- },
  { "tpope/vim-surround" },
  -- { "kylechui/nvim-surround" },
  { "tpope/vim-fugitive" },
  -- required by fugitive to :Gbrowse
  { 'tpope/vim-rhubarb' },
  { 'tpope/vim-repeat' },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() and rgba() functions
        hsl_fn = true,   -- CSS hsl() and hsla() functions
        css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  { 'simrat39/symbols-outline.nvim' },
  {
    'rmagatti/goto-preview',
  },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  -- { 'github/copilot.vim', branch = 'release' },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        -- suggestion = { enabled = false },
        -- panel = { enabled = false },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<ALT-]>",
            prev = "<ALT-[>",
            dismiss = "<C-]>",
          },
        },
      })
    end
  },
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup({
  --       method = "getCompletionsCycling",
  --       formatters = {
  --         label = require("copilot_cmp.format").format_label_text,
  --         insert_text = require("copilot_cmp.format").format_insert_text,
  --         preview = require("copilot_cmp.format").deindent,
  --       },
  --     })
  --   end
  -- },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup(
        {
          mappings = { '<C-u>', '<C-d>', '<C-b>',
            '<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
        }

      )
    end,
  },
}
require("lvim.lsp.manager").setup("emmet_ls")

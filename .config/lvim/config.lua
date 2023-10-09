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
lvim.builtin.nvimtree.setup.view.width = 45
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
lvim.builtin.which_key.mappings["W"] = { "<cmd>:wa<cr>", "Save all" }
lvim.builtin.which_key.mappings["ai"] = { "<cmd>:Copilot panel<cr>", "Copilot" }
lvim.builtin.which_key.mappings["b"]["f"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in current buffer" }
lvim.builtin.which_key.mappings["b"]["s"] = { "<cmd>Buffers<cr>", "Search Buffers" }
lvim.builtin.which_key.mappings["b"]["o"] = { "<cmd>%bd|e#|bd#<cr>", "Current Buffer Only" }
lvim.builtin.which_key.mappings["b"]["c"] = { "<cmd>b#|bd#<cr>", "Close Buffer" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>GBrowse!<cr>", "Git Browse!" }
lvim.builtin.which_key.mappings["g"]["l"] = { "<cmd>Git blame<cr>", "Git Blame!" }
lvim.builtin.which_key.mappings["g"]["S"] = { "<cmd>Git<cr>", "Git Status" }

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
        suggestion = { enabled = false },
        panel = { enabled = false },
        -- suggestion = {
        --   enabled = true,
        --   auto_trigger = true,
        --   debounce = 75,
        --   keymap = {
        --     accept = "<C-l>",
        --     accept_word = false,
        --     accept_line = false,
        --     next = "<ALT-l>",
        --     prev = "<ALT-h>",
        --     dismiss = "<C-h>",
        --   },
        -- },
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  },
  { 'christoomey/vim-tmux-navigator' },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      -- { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      -- { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
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

require('lspconfig').tailwindcss.setup {
  settings = {
    scss = { validate = false },
    editor = {
      quickSuggestions = { strings = true },
      autoClosingQuotes = 'always',
    },
    tailwindCSS = {
      experimental = {
        classRegex = {
          'tw`([^`]*)',          -- tw`...`
          'tw="([^"]*)',         -- <div tw="..." />
          'tw={"([^"}]*)',       -- <div tw={"..."} />
          'tw\\.\\w+`([^`]*)',   -- tw.xxx`...`
          'tw\\(.*?\\)`([^`]*)', -- tw(Component)`...`
        },
      },
      includeLanguages = {
        typescript = 'javascript',
        typescriptreact = 'javascript',
      },
    },
  },
}

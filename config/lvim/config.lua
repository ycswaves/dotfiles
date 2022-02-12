-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = false
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"
-- vim.g.session_auto
vim.g.fzf_layout = {
  window = {
    width = 0.85,
    height = 0.85
  }
}
-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
vim.o.sessionoptions="curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
-- vim.g.bufferline = {
--   maximum_length = 120,
-- }

-- lvim.builtin.bufferline.insert_at_end = false

-- lvim.colorscheme = "onedark"
-- vim.g.material_style = "deep ocean"

vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.width = 50


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

vim.cmd([[
  nmap <C-f> :Ag<Space>
  nmap [q :cprevious <CR>
  nmap ]q :cnext <CR>
]])


lvim.keys.normal_mode = {
  -- Better window movement
  ["<C-h>"] = "<C-w>h",
  ["<C-j>"] = "<C-w>j",
  ["<C-k>"] = "<C-w>k",
  ["<C-l>"] = "<C-w>l",
  ["<C-p>"] = ":Telescope find_files<CR>",

  -- Resize with arrows
  ["<C-Up>"] = ":resize -2<CR>",
  ["<C-Down>"] = ":resize +2<CR>",
  ["<C-Left>"] = ":vertical resize -2<CR>",
  ["<C-Right>"] = ":vertical resize +2<CR>",

   -- Navigate buffers
   ["<S-Tab>"] = ":BufferLineCyclePrev<CR>",
   ["<Tab>"] = ":BufferLineCycleNext<CR>",

 }

lvim.builtin.which_key.mappings["*"] = { "<Plug>(FerretAckWord)", "FerretAckWord" }
lvim.builtin.which_key.mappings["f"] = { "<Plug>(FerretBack)", "Search in file" }
lvim.builtin.which_key.mappings["f"] = { "<Plug>(FerretBack)", "Search in file" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>GBrowse!<cr>", "Git Browse!" }
lvim.builtin.which_key.mappings["g"]["l"] = { "<cmd>Git blame<cr>", "Git Blame!" }
lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  { exe = "gofmt" },
  {
    exe = "prettier",
    -- filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  -- { exe = "flake8" },
  {
    exe = "eslint_d",
    -- filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  }
}

local util = require("lspconfig/util")
lvim.lang.ruby.lsp.setup = {
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    init_options = {
      formatting = true
    },
    root_dir = util.root_pattern("Gemfile", ".git"),
    settings = {
      solargraph = {
        diagnostics = false
      }
    }
}


lvim.plugins = {
  {"lunarvim/colorschemes"},
  {"prettier/vim-prettier"},
  {"marko-cerovac/material.nvim"},
  {'yashguptaz/calvera-dark.nvim'},
  -- {
  --   "sunjon/shade.nvim",
  --   config = function ()
  --     require('shade').setup({
  --       overlay_opacity = 70,
  --       opacity_step = 1,
  --     })
  --   end
  -- },
  {"tpope/vim-surround"},
  {"tpope/vim-fugitive"},
  -- required by fugitive to :Gbrowse
  {'tpope/vim-rhubarb'},
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  {'simrat39/symbols-outline.nvim'},
  {"folke/tokyonight.nvim"},
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("indent_blankline").setup {
        char = "│",
        -- let g:indent_blankline_char_list = ['|', '¦', '┆', '┊']
        filetype_exclude = {"dashboard", "markdown"},
        buftype_exclude = {"terminal", "nofile"},
        use_treesitter = true
      }
    end,
  },
  {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup({
        width = 135; -- Width of the floating window
        height = 20; -- Height of the floating window
        -- default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
      })
    end
  },
  {'wincent/ferret'},
  {'junegunn/fzf'},
  {'junegunn/fzf.vim'},
  -- {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
  -- {'xolox/vim-misc'},
  -- {'xolox/vim-session'},
}

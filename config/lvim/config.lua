-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.lsp.diagnostics.virtual_text = false
-- lvim.colorscheme = "catppuccin"
-- vim.g.catppuccin_flavour = "mocha"
lvim.colorscheme = "tokyonight"
vim.g.tokyonight_style = "night"
vim.g.fzf_layout = {
  window = {
    width = 0.85,
    height = 0.85
  }
}
-- vim.o.sessionoptions="blank,buffers,curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
vim.o.sessionoptions = "curdir,folds,help,options,tabpages,winsize,resize,winpos,terminal"
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.relativenumber = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.width = 50
lvim.builtin.autopairs.active = true
lvim.builtin.telescope = {
  active = true,
  defaults = {
    layout_strategy = "horizontal",
  },
}


lvim.builtin.project.detection_methods = {
  "pattern",
  "lsp",
}
lvim.builtin.project.patterns = {
  "package.json",
  ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile",
}

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
  nmap <C-f> :Ag<CR>
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

lvim.builtin.which_key.mappings["*"] = { "<cmd>Telescope grep_string<cr>", "Search string under cursor" }
lvim.builtin.which_key.mappings["b"]["f"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search in current buffer" }
lvim.builtin.which_key.mappings["b"]["s"] = { "<cmd>Buffers<cr>", "Search Buffers" }
lvim.builtin.which_key.mappings["b"]["o"] = { "<cmd>%bd|e#|bd#<cr>", "Current Buffer Only" }
lvim.builtin.which_key.mappings["b"]["c"] = { "<cmd>b#|bd#<cr>", "Close Buffer" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>GBrowse!<cr>", "Git Browse!" }
lvim.builtin.which_key.mappings["g"]["l"] = { "<cmd>Git blame<cr>", "Git Blame!" }
lvim.builtin.which_key.mappings["g"]["S"] = { "<cmd>Git<cr>", "Git Status" }
lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "DAP UI" }
lvim.builtin.which_key.mappings["ag"] = { "<cmd>call fzf#vim#ag(expand('<cword>'), fzf#vim#with_preview())<cr>",
  "Search under cursor" }
lvim.builtin.which_key.mappings["wa"] = { "<cmd>:wa<cr>", "Save all" }


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black" },
  { exe = "gofmt" },
  { exe = "eslint_d" },
  {
    exe = "prettier",
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
  { "catppuccin/nvim", as = "catppuccin" },
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
  { 'simrat39/symbols-outline.nvim' },
  {
    'rmagatti/goto-preview',
  },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'karb94/neoscroll.nvim',
    require('neoscroll').setup(
      { mappings = { '<C-u>', '<C-d>', '<C-b>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb' }, }
    )
  },
}

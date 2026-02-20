-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })
vim.keymap.set("n", "<C-Space>", "<Cmd>TmuxNavigateNavigateNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>gj", "<Cmd>Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
vim.keymap.set("n", "<leader>gk", "<Cmd>Gitsigns prev_hunk<CR>", { desc = "Prev Hunk" })
vim.keymap.set("n", "<leader>ww", "<Cmd>w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>wa", "<Cmd>wa<CR>", { desc = "Save All" })
vim.keymap.set("n", "<leader>bj", "<Cmd>BufferLinePick<CR>", { desc = "Buffer Pick" })
vim.keymap.set("n", "<leader>go", "<cmd>GBrowse!<cr>", { desc = "Git Browse!" })
vim.keymap.set("n", "<leader>gbl", "<cmd>Git blame<cr>", { desc = "Git Blame!" })
vim.keymap.set("n", "<leader>gS", "<cmd>Git<cr>", { desc = "Git Status" })
vim.keymap.set("n", "<leader>xj", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next Diagnosis" })
vim.keymap.set("n", "<leader>xk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev Diagnosis" })

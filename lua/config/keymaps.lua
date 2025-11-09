-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("x", "p", '"_dP', { desc = "Paste without yanking selected text" })

-- Yank into system clipboard by default
vim.keymap.set({ "n", "v" }, "y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "Y", '"+y$', { desc = "Yank line to system clipboard" })

-- Keep normal yank available under 'gy'
vim.keymap.set({ "n", "v" }, "gy", "y", { desc = "Yank to Vim register" })

-- Copilot suggestions
-- vim.keymap.set("i", "<M-]>", function()
--     require("copilot.suggestion").next()
-- end, { desc = "Next Copilot suggestion" })
--
-- vim.keymap.set("i", "<M-[>", function()
--     require("copilot.suggestion").prev()
-- end, { desc = "Previous Copilot suggestion" })
--
-- vim.keymap.set("i", "<M-\\>", function()
--     require("copilot.suggestion").accept()
-- end, { desc = "Accept Copilot suggestion" })

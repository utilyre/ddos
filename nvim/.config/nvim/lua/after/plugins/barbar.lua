local state = require("bufferline.state")
local whichkey = require("which-key")

vim.g.bufferline = {
  icon_separator_active = "",
  icon_separator_inactive = "",
}

local gBarbar = vim.api.nvim_create_augroup("Barbar", {})
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = gBarbar,
  callback = function()
    if vim.bo.filetype ~= "NvimTree" then return end
    state.set_offset(40, "Explorer")
  end
})
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = gBarbar,
  callback = function()
    if not vim.fn.expand("<afile>"):match("NvimTree") then return end
    state.set_offset(0)
  end
})

vim.keymap.set("n", "<s-e>", "<cmd>edit<cr>")
vim.keymap.set("n", "<s-w>", "<cmd>write<cr>")
vim.keymap.set("n", "<s-q>", "<cmd>BufferClose<cr>")
vim.keymap.set("n", "<s-h>", "<cmd>BufferPrevious<cr>")
vim.keymap.set("n", "<s-l>", "<cmd>BufferNext<cr>")
whichkey.register({
  n = { "<cmd>enew<cr>", "New" },
  q = { "<cmd>quitall<cr>", "Quit" },
}, { prefix = "<leader>" })

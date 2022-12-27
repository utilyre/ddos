local spec = {
  "numtostr/fterm.nvim",
  dependencies = {
    "samjwill/nvim-unception",
  },
}

function spec.config()
  local fterm = require("FTerm")

  fterm.setup({
    border = "rounded",
    hl = "NormalFloat",
  })

  vim.api.nvim_create_augroup("fterm", {})
  vim.api.nvim_create_autocmd("User", {
    group = "fterm",
    pattern = "UnceptionEditRequestReceived",
    callback = vim.callback(fterm.toggle),
  })

  vim.keymap.set({ "n", "t" }, "<c-\\>", vim.callback(fterm.toggle))
end

return spec

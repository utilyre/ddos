local spec = {
  "numtostr/FTerm.nvim",
  dev = true,
  dependencies = {
    "samjwill/nvim-unception",
  },
}

function spec.config()
  local fterm = require("FTerm")

  fterm.setup({
    border = "rounded",
    hl = "NormalFloat",
    on_attach = function(terminal, bufnr)
      local function snap(direction)
        local width = 0.8
        local height = 0.8
        local x = 0.5
        local y = 0.5
        if direction == "left" then
          width = 0.4
          x = 0.0
        elseif direction == "right" then
          width = 0.4
          x = 1.0
        elseif direction == "top" then
          height = 0.4
          y = 0.0
        elseif direction == "bottom" then
          height = 0.4
          y = 1.0
        end

        terminal:setup({
          dimensions = {
            width = width,
            height = height,
            x = x,
            y = y,
          },
        })

        terminal:close()
        terminal:open()
      end

      local function map(left, right)
        vim.keymap.set("t", "<c-w>" .. left, right, { buffer = bufnr })
      end

      map("=", vim.callback(snap, "center"))
      map("H", vim.callback(snap, "left"))
      map("L", vim.callback(snap, "right"))
      map("K", vim.callback(snap, "top"))
      map("J", vim.callback(snap, "bottom"))
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("fterm", {}),
    pattern = "UnceptionEditRequestReceived",
    callback = vim.callback(fterm.toggle),
  })

  vim.keymap.set({ "n", "t" }, "<c-\\>", vim.callback(fterm.toggle))
end

return spec

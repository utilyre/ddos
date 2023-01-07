local spec = {
  "jose-elias-alvarez/null-ls.nvim",
}

function spec.config()
  local null = require("null-ls")

  local sources_path = vim.fn.stdpath("config") .. "/user/sources.lua"
  if vim.loop.fs_stat(sources_path) then dofile(sources_path) end

  null.setup({
    border = "rounded",
  })
end

return spec

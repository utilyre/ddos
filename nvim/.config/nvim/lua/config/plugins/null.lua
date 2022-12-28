local spec = {
  "jose-elias-alvarez/null-ls.nvim",
}

function spec.config()
  local null = require("null-ls")

  local sources = {}
  local sources_path = vim.fn.stdpath("config") .. "/user/sources.lua"
  if vim.loop.fs_stat(sources_path) then sources = dofile(sources_path) end

  null.setup({
    sources = sources,
    border = "rounded",
  })
end

return spec

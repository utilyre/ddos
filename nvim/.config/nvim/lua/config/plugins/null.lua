local spec = {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
  },
}

function spec.config()
  local null = require("null-ls")

  null.setup({
    sources = table.reduce(vim.g.sources, function(accumulator, sources, method)
      return table.merge(
        accumulator,
        table.map(sources, function(options, source)
          return null.builtins[method][source].with(options)
        end)
      )
    end, {}),
  })
end

return spec

local spec = {
  "jose-elias-alvarez/null-ls.nvim",
}

function spec.config()
  local null = require("null-ls")

  local sources_ok, sources = pcall(dofile, vim.fn.stdpath("config") .. "/sources.lua")
  null.setup({
    sources = table.reduce(sources_ok and sources or {}, function(accumulator, sources, method)
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

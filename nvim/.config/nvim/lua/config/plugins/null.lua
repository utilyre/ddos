local null = require("null-ls")

local config = vim.json.decode(vim.fs.read(os.getenv("MASON_CONFIG")) or "{}")

null.setup({
  sources = {
    unpack(table.map(config.linters or {}, function(options, linter)
      return null.builtins.diagnostics[linter].with(options)
    end)),
    unpack(table.map(config.formatters or {}, function(options, formatter)
      return null.builtins.formatting[formatter].with(options)
    end)),
  },
})

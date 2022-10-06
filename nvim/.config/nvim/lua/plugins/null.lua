local null = require("null-ls")

local get_sources = function()
  local config = vim.json.decode(vim.fs.read(os.getenv("MASON_CONFIG")) or "{}")
  local sources = {}

  for linter, options in pairs(config.linters or {}) do
    table.insert(sources, null.builtins.diagnostics[linter].with(options))
  end
  for formatter, options in pairs(config.formatters or {}) do
    table.insert(sources, null.builtins.formatting[formatter].with(options))
  end

  return sources
end

null.setup({
  sources = get_sources(),
})

local null = require("null-ls")

local sources = {}

local config = vim.json.decode(vim.fs.read(os.getenv("MASON_CONFIG")) or "{}")
for linter, options in pairs(config.linters or {}) do
  table.insert(sources, null.builtins.diagnostics[linter].with(options))
end
for formatter, options in pairs(config.formatters or {}) do
  table.insert(sources, null.builtins.formatting[formatter].with(options))
end

null.setup({
  update_in_insert = true,
  sources = sources,
})

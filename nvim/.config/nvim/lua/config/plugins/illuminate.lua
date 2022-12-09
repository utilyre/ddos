local illuminate = require("illuminate")

illuminate.configure({
  modes_allowlist = { "n" },
  providers = { "lsp", "treesitter" },
})

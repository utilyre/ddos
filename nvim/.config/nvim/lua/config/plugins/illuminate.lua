local illuminate = require("illuminate")

illuminate.configure({
  modes_allowlist = { "n", "i" },
  providers = { "lsp", "treesitter" },
})

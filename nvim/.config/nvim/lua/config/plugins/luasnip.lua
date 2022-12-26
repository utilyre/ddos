local spec = {
  "l3mon4d3/luasnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
}

function spec.init()
  local vscode = require("luasnip.loaders.from_vscode")

  vscode.load()
end

function spec.config()
  local luasnip = require("luasnip")

  luasnip.config.setup({
    region_check_events = "CursorMoved",
  })
end

return spec

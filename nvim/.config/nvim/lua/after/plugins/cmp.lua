local cmp = require("cmp")
local luasnip = require("luasnip")
local autopairs = require("nvim-autopairs")
local completion = require("nvim-autopairs.completion.cmp")

local kinds = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

cmp.setup({
  window = {
    documentation = {
      border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
    },
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, item)
      item.kind = kinds[item.kind]
      return item
    end,
  },
  mapping = {
    ["<c-space>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end, { "i" }),
    ["<c-d>"] = cmp.mapping.scroll_docs(3),
    ["<c-u>"] = cmp.mapping.scroll_docs(-3),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
    ["<s-tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<c-k>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active(-1) then
        luasnip.change_choice(-1)
      else
        fallback()
      end
    end),
    ["<c-j>"] = cmp.mapping(function(fallback)
      if luasnip.choice_active(1) then
        luasnip.change_choice(1)
      else
        fallback()
      end
    end),
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  sources = {
    { name = "luasnip", max_item_count = 2 },
    { name = "nvim_lsp" },
    { name = "buffer" },
  },
})

cmp.event:on("confirm_done", completion.on_confirm_done({ map_char = { tex = "" } }))
autopairs.setup({
  check_ts = true,
})

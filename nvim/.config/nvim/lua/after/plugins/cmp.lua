local cmp = require("cmp")
local luasnip = require("luasnip")
local git = require("cmp_git")
local autopairs = require("nvim-autopairs")
local completion = require("nvim-autopairs.completion.cmp")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, item)
      item.kind = vim.g.symbols.kinds[item.kind]
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
    {
      group_index = 1,
      name = "luasnip",
      max_item_count = 2,
    },
    {
      group_index = 1,
      name = "nvim_lsp",
    },
    {
      group_index = 1,
      name = "git",
    },
    {
      group_index = 2,
      name = "buffer",
    },
    {
      group_index = 2,
      name = "spell",
    },
  },
})

git.setup()

cmp.event:on("confirm_done", completion.on_confirm_done({ map_char = { tex = "" } }))
autopairs.setup({
  check_ts = true,
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local autopairs = require("nvim-autopairs")
local completion = require("nvim-autopairs.completion.cmp")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, item)
      item.kind = vim.g.symbols.kind[item.kind]
      return item
    end,
  },
  snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
  experimental = { ghost_text = true },
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
      group_index = 2,
      name = "buffer",
      option = {
        get_bufnrs = vim.api.nvim_create_hof(vim.api.nvim_list_bufs),
      },
    },
    {
      group_index = 2,
      name = "spell",
    },
  },
  mapping = {
    ["<c-space>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end, { "i" }),
    ["<c-u>"] = cmp.mapping(vim.api.nvim_create_hof(cmp.scroll_docs, -3), { "i", "s" }),
    ["<c-d>"] = cmp.mapping(vim.api.nvim_create_hof(cmp.scroll_docs, 3), { "i", "s" }),
    ["<c-p>"] = cmp.mapping(vim.api.nvim_create_hof(cmp.select_prev_item), { "i", "s" }),
    ["<c-n>"] = cmp.mapping(vim.api.nvim_create_hof(cmp.select_next_item), { "i", "s" }),
    ["<s-tab>"] = cmp.mapping(vim.api.nvim_create_hof(luasnip.jump, -1), { "i", "s" }),
    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" })
  },
})

cmp.event:on("confirm_done", completion.on_confirm_done())
autopairs.setup({
  check_ts = true,
})

local cmp = require("cmp")
local luasnip = require("luasnip")
local git = require("cmp_git")

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, item)
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
      group_index = 1,
      name = "git",
    },
    {
      group_index = 2,
      name = "buffer",
      option = {
        get_bufnrs = vim.hof(vim.api.nvim_list_bufs),
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
})

git.setup()

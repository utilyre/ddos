local completion = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")
local cmp = require("cmp")
local git = require("cmp_git")

cmp.event:on("confirm_done", completion.on_confirm_done())

cmp.setup({
  snippet = {
    expand = function(opts)
      luasnip.lsp_expand(opts.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(entry, item)
      item.kind = _G.icons.kind[item.kind]
      return item
    end,
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
      option = {
        get_bufnrs = function()
          local bufnrs = vim.tbl_filter(function(bufnr)
            return vim.api.nvim_buf_is_loaded(bufnr)
          end, vim.api.nvim_list_bufs())

          return bufnrs
        end,
      },
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
    ["<c-u>"] = cmp.mapping(vim.fun_lambda(cmp.scroll_docs, -10), { "i", "s" }),
    ["<c-d>"] = cmp.mapping(vim.fun_lambda(cmp.scroll_docs, 10), { "i", "s" }),
    ["<c-p>"] = cmp.mapping(vim.fun_lambda(cmp.select_prev_item), { "i", "s" }),
    ["<c-n>"] = cmp.mapping(vim.fun_lambda(cmp.select_next_item), { "i", "s" }),
    ["<s-tab>"] = cmp.mapping(vim.fun_lambda(luasnip.jump, -1), { "i", "s" }),
    ["<tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
})

git.setup()

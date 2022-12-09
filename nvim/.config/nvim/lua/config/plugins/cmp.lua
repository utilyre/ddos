local cmp = require("cmp")
local git = require("cmp_git")
local completion = require("nvim-autopairs.completion.cmp")
local luasnip = require("luasnip")

cmp.event:on("confirm_done", completion.on_confirm_done())

cmp.setup({
  snippet = {
    expand = function(options)
      luasnip.lsp_expand(options.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = {
      scrolloff = vim.go.scrolloff,
      border = "rounded",
    },
    documentation = {
      border = "rounded",
    },
  },
  formatting = {
    fields = { "kind", "abbr" },
    format = function(_, item)
      item.kind = vim.g.icons.kind[item.kind]
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
      group_index = 2,
      name = "git",
    },
    {
      group_index = 3,
      name = "emoji",
    },
    {
      group_index = 4,
      name = "buffer",
      option = {
        get_bufnrs = function()
          local bufnrs = table.filter(vim.api.nvim_list_bufs(), function(bufnr)
            return vim.api.nvim_buf_is_loaded(bufnr)
          end)

          return bufnrs
        end,
      },
    },
  },
  mapping = {
    ["<c-space>"] = function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end,
    ["<c-y>"] = function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(-1)
      else
        fallback()
      end
    end,
    ["<c-e>"] = function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(1)
      else
        fallback()
      end
    end,
    ["<c-p>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<c-n>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<s-tab>"] = function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end,
    ["<tab>"] = function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      elseif luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end,
  },
})

git.setup()

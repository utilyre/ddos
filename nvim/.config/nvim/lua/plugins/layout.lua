local barbecue = require("barbecue")
local lualine = require("lualine")
local theme = require("lualine.themes.auto")
local sources = require("null-ls.sources")

barbecue.setup({
  symbols = {
    modified = "%#BufferVisibleMod#" .. _G.icons.ui.Modified .. "%*",
  },
  kinds = _G.icons.kind,
})

lualine.setup({
  options = {
    globalstatus = true,
    component_separators = _G.icons.ui.Separator,
    section_separators = {
      left = _G.icons.ui.SectionRight,
      right = _G.icons.ui.SectionLeft,
    },
    theme = vim.tbl_deep_extend("force", theme, {
      normal = {
        c = { bg = "none" },
      },
    }),
  },
  sections = {
    lualine_a = {
      {
        function()
          return "code"
        end,
        separator = {
          left = _G.icons.ui.SectionLeft,
          right = _G.icons.ui.SectionRight,
        },
      },
    },
    lualine_b = {
      {
        "branch",
      },
      {
        "diff",
        colored = false,
        symbols = {
          added = _G.icons.git.Added,
          modified = _G.icons.git.Modified,
          removed = _G.icons.git.Deleted,
        },
      },
      {
        "diagnostics",
        update_in_insert = true,
        symbols = {
          hint = _G.icons.diagnostic.Suggestion .. " ",
          info = _G.icons.diagnostic.Information .. " ",
          warn = _G.icons.diagnostic.Warning .. " ",
          error = _G.icons.diagnostic.Error .. " ",
        },
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        function()
          local names = vim.tbl_remove(vim.tbl_keys(_G.terminals), _G.lastkey)
          return (_G.lastkey or "") .. "%#Conceal#(" .. table.concat(names) .. ")"
        end,
      },
    },
    lualine_y = {
      {
        function()
          local clients = vim.tbl_map(function(client)
            return client.name
          end, vim.lsp.buf_get_clients())

          vim.tbl_remove(clients, "null-ls")
          vim.tbl_insert(
            clients,
            unpack(vim.tbl_map(function(client)
              return client.name
            end, sources.get_available(vim.bo.filetype)))
          )

          return table.concat(vim.tbl_unique(clients), " ")
        end,
      },
      {
        "filetype",
      },
    },
    lualine_z = {
      {
        "location",
        separator = {
          left = _G.icons.ui.SectionLeft,
          right = _G.icons.ui.SectionRight,
        },
      },
    },
  },
})

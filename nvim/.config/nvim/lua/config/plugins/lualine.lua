local lualine = require("lualine")
local sources = require("null-ls.sources")

lualine.setup({
  options = {
    globalstatus = true,
    component_separators = _G.icons.ui.Separator,
    section_separators = {
      left = _G.icons.ui.SectionRight,
      right = _G.icons.ui.SectionLeft,
    },
  },
  sections = {
    lualine_a = {
      {
        "\"code\"",
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
          local names = vim.tbl_filter(function(key)
            return key ~= _G.lastkey
          end, vim.tbl_keys(_G.terminals))

          return (_G.lastkey or "") .. "%#Conceal#(" .. table.concat(names) .. ")"
        end,
      },
    },
    lualine_y = {
      {
        function()
          local names = vim.tbl_unique({
            unpack(vim.tbl_map(
              function(client)
                return client.name
              end,
              vim.tbl_filter(function(client)
                return client.name ~= "null-ls"
              end, vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() }))
            )),
            unpack(vim.tbl_map(function(source)
              return source.name
            end, sources.get_available(vim.bo.filetype))),
          })

          return table.concat(names, " ")
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

local lualine = require("lualine")
local sources = require("null-ls.sources")

lualine.setup({
  options = {
    globalstatus = true,
    component_separators = vim.g.icons.ui.Separator,
    section_separators = {
      left = vim.g.icons.ui.SectionRight,
      right = vim.g.icons.ui.SectionLeft,
    },
  },
  sections = {
    lualine_a = {
      {
        "\"code\"",
        separator = {
          left = vim.g.icons.ui.SectionLeft,
          right = vim.g.icons.ui.SectionRight,
        },
      },
    },
    lualine_b = {
      {
        "branch",
      },
      {
        "diff",
        symbols = {
          added = vim.g.icons.git.Added,
          modified = vim.g.icons.git.Modified,
          removed = vim.g.icons.git.Deleted,
        },
      },
      {
        "diagnostics",
        symbols = {
          hint = vim.g.icons.diagnostic.Suggestion .. " ",
          info = vim.g.icons.diagnostic.Information .. " ",
          warn = vim.g.icons.diagnostic.Warning .. " ",
          error = vim.g.icons.diagnostic.Error .. " ",
        },
      },
    },
    lualine_c = {},
    lualine_x = {
      {
        function()
          local names = table.filter(vim.tbl_keys(_G.terminals), function(key)
            return key ~= _G.lastkey
          end)

          return (_G.lastkey or "") .. "%#Conceal#(" .. table.concat(names) .. ")"
        end,
      },
    },
    lualine_y = {
      {
        function()
          local names = table.unique({
            unpack(
              table.map(
                table.filter(vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() }), function(client)
                  return client.name ~= "null-ls"
                end),
                function(client)
                  return client.name
                end
              )
            ),
            unpack(table.map(sources.get_available(vim.bo.filetype), function(source)
              return source.name
            end)),
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
          left = vim.g.icons.ui.SectionLeft,
          right = vim.g.icons.ui.SectionRight,
        },
      },
    },
  },
})

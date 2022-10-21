local lualine = require("lualine")
local noice = require("noice")
local sources = require("null-ls.sources")

lualine.setup({
  options = {
    globalstatus = true,
    component_separators = vim.g.icons.fill.Separator,
    section_separators = {
      left = vim.g.icons.fill.SectionRight,
      right = vim.g.icons.fill.SectionLeft,
    },
  },
  sections = {
    lualine_a = {
      {
        "%P",
        separator = {
          left = vim.g.icons.fill.SectionLeft,
          right = vim.g.icons.fill.SectionRight,
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
    lualine_c = {
      {
        function()
          return noice.api.statusline.mode.get() or ""
        end,
      },
    },
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
      {
        function()
          return vim.g.icons.widget.Indent .. " " .. (vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop)
        end,
      },
    },
    lualine_z = {
      {
        "location",
        separator = {
          left = vim.g.icons.fill.SectionLeft,
          right = vim.g.icons.fill.SectionRight,
        },
      },
    },
  },
})

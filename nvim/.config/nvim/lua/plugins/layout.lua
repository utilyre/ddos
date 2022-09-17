local theme = require("lualine.themes.auto")
local bufferline = require("bufferline")
local barbecue = require("barbecue")
local lualine = require("lualine")
local sources = require("null-ls.sources")

bufferline.setup({
  options = {
    persist_buffer_sort = false,
    show_close_icon = false,
    show_buffer_close_icons = false,
    modified_icon = _G.icons.ui.Modified,
    left_trunc_marker = _G.icons.ui.TruncLeft,
    right_trunc_marker = _G.icons.ui.TruncRight,
    custom_areas = {
      right = function()
        local names = vim.tbl_remove(vim.tbl_keys(_G.terminals), _G.lastname)
        return {
          { text = table.concat(names) },
          { text = " " },
          { text = _G.lastname },
          { text = "  " },
        }
      end,
    },
  },
})

vim.keymap.set("n", "<s-h>", vim.get_hof(bufferline.cycle, -1))
vim.keymap.set("n", "<s-l>", vim.get_hof(bufferline.cycle, 1))

barbecue.setup({
  icons = {
    File = _G.icons.kind.File .. " ",
    Package = _G.icons.kind.Folder .. " ",
    Module = _G.icons.kind.Module .. " ",
    Namespace = _G.icons.kind.Module .. " ",
    Class = _G.icons.kind.Class .. " ",
    Constructor = _G.icons.kind.Constructor .. " ",
    Field = _G.icons.kind.Field .. " ",
    Property = _G.icons.kind.Property .. " ",
    Method = _G.icons.kind.Method .. " ",
    Struct = _G.icons.kind.Struct .. " ",
    Event = _G.icons.kind.Event .. " ",
    Interface = _G.icons.kind.Interface .. " ",
    Enum = _G.icons.kind.Enum .. " ",
    EnumMember = _G.icons.kind.EnumMember .. " ",
    Constant = _G.icons.kind.Constant .. " ",
    Function = _G.icons.kind.Function .. " ",
    TypeParameter = _G.icons.kind.TypeParameter .. " ",
    Variable = _G.icons.kind.Variable .. " ",
    Operator = _G.icons.kind.Operator .. " ",
    Null = _G.icons.type.Null .. " ",
    Boolean = _G.icons.type.Boolean .. " ",
    Number = _G.icons.type.Number .. " ",
    String = _G.icons.type.String .. " ",
    Key = _G.icons.type.String .. " ",
    Array = _G.icons.type.Array .. " ",
    Object = _G.icons.type.Object .. " ",
  },
})

lualine.setup({
  options = {
    globalstatus = true,
    component_separators = _G.icons.ui.ComponentSeparator,
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
        "mode",
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
    lualine_x = {},
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

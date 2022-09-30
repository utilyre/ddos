local mark = require("harpoon.mark")
local barbecue = require("barbecue")
local fidget = require("fidget")
local lualine = require("lualine")
local theme = require("lualine.themes.auto")
local sources = require("null-ls.sources")

barbecue.setup({
  custom_section = function()
    local bufnrs = vim.tbl_filter(function(bufnr)
      return vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buftype == ""
    end, vim.api.nvim_list_bufs())

    return mark.get_length() .. "/" .. #bufnrs
  end,
  symbols = {
    modified = "%#BufferMod#" .. _G.icons.ui.Modified,
  },
  kinds = _G.icons.kind,
})

fidget.setup({
  timer = {
    spinner_rate = 60,
  },
  window = {
    zindex = 1,
  },
  fmt = {
    stack_upwards = false,
  },
  text = {
    spinner = "arc",
    done = _G.icons.ui.Ready,
  },
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
            unpack(vim.tbl_map(function(client)
              if client.name ~= "null-ls" then
                return client.name
              end
            end, vim.lsp.buf_get_clients())),
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

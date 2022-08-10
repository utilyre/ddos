vim.get_hof = function(fun, ...)
  local params = { ... }
  return function()
    return fun(unpack(params))
  end
end

vim.tbl_insert = function(tbl, ...)
  for i, element in ipairs({ ... }) do
    table.insert(tbl, element)
  end

  return tbl
end

vim.tbl_remove = function(tbl, value)
  for i, element in ipairs(tbl) do
    if element == value then
      table.remove(tbl, i)
    end
  end

  return tbl
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

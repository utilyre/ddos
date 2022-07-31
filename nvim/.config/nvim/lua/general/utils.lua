vim.get_hof = function(fun, ...)
  local params = { ... }
  return function()
    return fun(unpack(params))
  end
end

vim.tbl_remove = function(tbl, value)
  for k, v in pairs(tbl) do
    if v == value then
      table.remove(tbl, k)
    end
  end

  return tbl
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

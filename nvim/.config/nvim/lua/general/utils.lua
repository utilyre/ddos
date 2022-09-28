vim.get_hof = function(fun, ...)
  local params = { ... }

  return function()
    return fun(unpack(params))
  end
end

vim.tbl_unique = function(tbl)
  local hash = {}
  for i, element in ipairs(tbl) do
    if hash[element] then
      table.remove(tbl, i)
    end

    hash[element] = true
  end

  return tbl
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

vim.get_hof = function(fun, ...)
  local params = { ... }

  return function()
    return fun(unpack(params))
  end
end

vim.tbl_unique = function(tbl)
  local flat = vim.tbl_flatten(tbl)
  local hash = {}

  for i, value in ipairs(flat) do
    if hash[value] then
      table.remove(flat, i)
    end

    hash[value] = true
  end

  return flat
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

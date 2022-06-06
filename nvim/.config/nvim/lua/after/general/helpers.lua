vim.str_isempty = function(str)
  return str == nil or str == ""
end

vim.api.nvim_create_hof = function(fun, ...)
  local params = { ... }
  return function()
    return fun(unpack(params))
  end
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

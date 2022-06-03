vim.str_isempty = function(str)
  return str == nil or str == ""
end

vim.fun_create_hof = function(fun, ...)
  local params = { ... }
  return function()
    return fun(unpack(params))
  end
end

vim.str_isempty = function(value)
  return value == nil or value == ""
end

vim.hof = function(f, ...)
  local params = { ... }
  return function()
    return f(unpack(params))
  end
end

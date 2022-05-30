function F(fn, ...)
  local params = ...
  return function()
    return fn(params)
  end
end

function P(object)
  vim.pretty_print(object)
  return object
end

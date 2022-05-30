function F(fn, ...)
  local params = ...
  return function()
    return fn(params)
  end
end

function P(object)
  local stringified = vim.inspect(object)
  print(stringified)
end

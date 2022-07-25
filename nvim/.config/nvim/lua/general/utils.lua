vim.str_escape = function(str)
  local escaped = str:gsub("[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%1")
  return escaped
end

vim.get_hof = function(fun, ...)
  local params = { ... }
  return function()
    return fun(unpack(params))
  end
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

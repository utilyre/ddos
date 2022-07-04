vim.str_isempty = function(str)
  return str == nil or str == ""
end

vim.str_gsub = function(str, patt, repl, from, to)
  from = from or 1
  to = to or str:len()
  return str:sub(1, from - 1) .. str:sub(from, to):gsub(patt, repl) .. str:sub(to + 1, str:len())
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

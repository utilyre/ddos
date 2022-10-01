vim.fun_lambda = function(fun, ...)
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

vim.fs.exists = function(name)
  local file, err = io.open(name, "r")
  if err ~= nil then
    return false
  end

  io.close(file)
  return true
end

vim.fs.read = function(name)
  local lines = {}
  for line in io.lines(name) do
    table.insert(lines, line)
  end

  return table.concat(lines, "\n")
end

vim.api.nvim_create_sign = function(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

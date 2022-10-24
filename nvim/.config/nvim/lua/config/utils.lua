function table.unique(list)
  local ret, hash = {}, {}
  for _, value in ipairs(list) do
    if not hash[value] then
      table.insert(ret, value)
    end

    hash[value] = true
  end

  return ret
end

function table.merge(...)
  local ret = {}
  for _, list in ipairs({ ... }) do
    for _, value in ipairs(list) do
      table.insert(ret, value)
    end
  end

  return ret
end

function table.filter(table, callback)
  local ret = {}
  for key, value in pairs(table) do
    local keep, k = callback(value, key)
    ret[k or #ret + 1] = keep and value or nil
  end

  return ret
end

function table.map(table, callback)
  local ret = {}
  for key, value in pairs(table) do
    local v, k = callback(value, key)
    ret[k or #ret + 1] = v
  end

  return ret
end

function table.reduce(table, callback, initial)
  local ret = initial
  for key, value in pairs(table) do
    ret = callback(ret, value, key)
  end

  return ret
end

function vim.fun_lambda(fun, ...)
  local params = { ... }

  return function()
    return fun(unpack(params))
  end
end

function vim.fs.exists(name)
  local file, err = io.open(name, "r")
  if err ~= nil then
    return false
  end

  io.close(file)
  return true
end

function vim.fs.read(name)
  if not vim.fs.exists(name) then
    return nil
  end

  local lines = {}
  for line in io.lines(name) do
    table.insert(lines, line)
  end

  return table.concat(lines, "\n")
end

function vim.api.nvim_create_sign(name, text)
  vim.fn.sign_define(name, { texthl = name, text = text })
  return { name, text }
end

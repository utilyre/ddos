function table.clone(tbl)
  if type(tbl) ~= "table" then
    return tbl
  end

  local clone = {}
  for key, value in pairs(tbl) do
    clone[table.clone(key)] = table.clone(value)
  end

  return clone
end

function table.unique(tbl)
  local clone = table.clone(tbl)
  local hash = {}

  for i, value in ipairs(clone) do
    if hash[value] then
      table.remove(clone, i)
    end

    hash[value] = true
  end

  return clone
end

function table.filter(tbl, predicate)
  local clone = table.clone(tbl)

  for key, value in pairs(tbl) do
    local keep = predicate(value, key, clone)
    if not keep then
      clone[key] = nil
    end
  end

  return clone
end

function table.map(tbl, predicate)
  local clone = table.clone(tbl)

  for key, value in pairs(tbl) do
    local v, k = predicate(value, key, clone)

    clone[key] = nil
    clone[k or #clone + 1] = v
  end

  return clone
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

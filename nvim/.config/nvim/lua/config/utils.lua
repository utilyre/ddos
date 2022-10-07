function vim.fun_lambda(fun, ...)
  local params = { ... }

  return function()
    return fun(unpack(params))
  end
end

function vim.tbl_unique(tbl)
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


local M = {}

function extractFinalPathComponent(path)
  local components = mysplit(path, "/")
  return components[#components]
end

function mysplit (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function startsWith(fullString, subString)

  print(string.format("Going looking for %s in %s", subString, fullString))

  local startIndex, endIndex = string.find(fullString, subString)

  print(string.format("Start Index is -> %s", startIndex))

  if startIndex == 1 then
    return true
  else
    return false
  end
end

function isNerdTreeBuffer(bufferName)
  local buffer_name = vim.api.nvim_buf_get_name(0)

  local finalPathComponent = string.lower(extractFinalPathComponent(buffer_name))

  return startsWith(finalPathComponent, "nvimtree_")
end

M.test = function(arguments)
  print("Running test funciton")
  local bufferName = vim.api.nvim_buf_get_name(0)

  if isNerdTreeBuffer(bufferName) then
    print("The current buffer is a NerdTree buffer")
  else
    print("The current buffer is NOT a NerdTree buffer")
  end

end

return M


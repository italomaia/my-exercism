local function flatten (aarray, array)
  array = array or {}
  for _, v in ipairs(aarray) do
    if v ~= nil then
      if type(v) == 'table' then
        flatten(v, array)
      else
        table.insert(array, v)
      end
    end
  end
  return array
end

return flatten
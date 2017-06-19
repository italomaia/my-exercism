local function flatten (nested_array, array)
  array = array or {}
  for _, v in ipairs(nested_array) do
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
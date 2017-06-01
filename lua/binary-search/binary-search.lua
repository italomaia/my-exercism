return function (array, v)
  if #array == 0 then return -1 end
  
  local first, last = 1, #array
  while true do
    local pos = math.floor((first + last)/2)
    local cur = array[pos]
    if cur == v then return pos end
    if first == last then return -1 end
    if v > cur then first = pos + 1
    else last = pos - 1 end
  end
  return -1
end
local module = {}

function module.compute(seca, secb)
  if #seca ~= #secb then
    return -1
  end

  local dist = 0
  for i=1,#seca do
    dist = dist + (seca:sub(i, i) ~= secb:sub(i, i) and 1 or 0)
  end
  return dist
end

return module
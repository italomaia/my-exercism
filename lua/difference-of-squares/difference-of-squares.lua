local pow = require('math').pow
local module = {}

function module.square_of_sums(num)
    local acum = 0
    for i=1, num do
      acum = acum + i
    end
    return pow(acum, 2)
end

function module.sum_of_squares(num)
  local acum = 0
  for i=1, num do
    acum = acum + pow(i, 2)
  end
  return acum
end

function module.difference_of_squares(num)
  return module.square_of_sums(num) - module.sum_of_squares(num)
end

return module

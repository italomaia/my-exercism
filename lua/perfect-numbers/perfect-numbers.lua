function table.str (t)
    local cp = {}
    for _, v in pairs(t) do table.insert(cp, tostring(v)) end
    return '[' .. table.concat(cp, ', ') .. ']'
end

function primes (n)
  local is_prime = {}
  local rt = {}

  for i=1, n do
    is_prime[i] = 1 ~= i
  end

  for i = 2, math.floor(math.sqrt(n)) do
    if is_prime[i] then
      for j = i*i, n, i do
        is_prime[j] = false
      end
    end
  end
  
  for i, v in ipairs(is_prime) do
    if v then table.insert(rt, i) end
  end
  
  return table.str(rt)
end

function factors(num)
  local rs = {}
  for i=1, math.floor(num/2) do
    if num % i == 0 then
      table.insert(rs, i)
    end
  end
  return rs
end

function math.sum(nums)
  local acum = 0
  for i, v in pairs(nums) do
    acum = acum + v
  end
  return acum
end

local function aliquot_sum (n)
  return math.sum(factors(n))
end

function classify (n)
  local aliquot_sum = math.sum(factors(n))
  if aliquot_sum == n then return "perfect" end
  if aliquot_sum > n then return "abundant" end
  return "deficient"
end

return {
    aliquot_sum = aliquot_sum,
    classify = classify
}
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

return {
    aliquot_sum = function (n) end,
    classify = function (n) end
}
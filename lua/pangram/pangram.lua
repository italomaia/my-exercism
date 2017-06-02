local function inrange(code)
  return code >= 97 and code <= 122
end

return function (word)
  word = word:lower()
  
  local pangram = {}
  
  for i=1, #word do
    local chr = word:sub(i, i)
    if inrange(string.byte(chr)) then
      pangram[chr] = true
    end
  end
  return 26 == #word
end
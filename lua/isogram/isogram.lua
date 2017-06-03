return function (word)
  word = word:lower()
  local map = {}
  for i=1,#word do
    local chr = word:sub(i, i)
    local code = string.byte(chr)
    if code >= 97 and code <= 122 then
      if map[chr] then return false end
      map[chr] = true
    end
  end
  return true
end
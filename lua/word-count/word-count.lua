local module = {}

local function inrange(chr)
  local code = string.byte(chr)
  return (48 <= code and code <= 57) 
    or (65 <= code and code <= 90)
    or (97 <= code and code <= 122)
end

function module.word_count (text)
  text = text:lower()
  local word = ''
  local count = {}
  
  for i=1,#text do
    local chr = text:sub(i, i)
    if inrange(chr) then word = word .. chr end
    if chr == ' ' and #word > 0 then
      count[word], word = (count[word] or 0) + 1, ''
    end
  end
  if #word > 0 then
    count[word] = (count[word] or 0) + 1
  end
  return count
end

return module
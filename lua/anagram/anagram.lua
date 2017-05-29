
function count_chars(word)
  -- char to char count map
  local rt = {}
  for i=1, #word do
    chr = word:sub(i, i)
    if rt[chr] == nil then
      rt[chr] = 1
    else
      rt[chr] = rt[chr] + 1
    end
  end
  return rt
end

local cls = {}

function cls:new (word)
  setmetatable({}, self)
  self.__index = self
  self.word = word
  self.count = count_chars(word:lower())
  return self
end

function cls:match (words)
  local rt = {}
  for _, word in ipairs(words) do
    local anagram = #self.word == #word
    for chr, count in pairs(count_chars(word:lower())) do
      anagram = (self.count[chr] == count) and anagram
      if not anagram then break end
    end
    if anagram then table.insert(rt, word) end
  end
  return rt
end

return cls
local function count_chars(word)
  -- char to char count map
  local rt = {}
  for i=1, #word do
    local chr = word:sub(i, i)
    rt[chr] = (rt[chr] or 0) + 1
  end
  return rt
end

local cls = {}

function cls:new (word)
  self.__index = self
  return setmetatable({
    word = word,
    count = count_chars(word:lower())
  }, self)
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
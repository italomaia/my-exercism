local module = {}

function module.word_count (text)
  local count = {}
  for word in text:lower():gmatch '[%a%d]+' do
    count[word] = (count[word] or 0) + 1
  end
  return count
end

return module

return function (sentence)
  local pangram = {}
  local count = 0
  for chr in string.gmatch(sentence:lower(), "[\97-\122]") do
    count = count + (pangram[chr] and 0 or 1)
    pangram[chr] = true
  end

  return 26 == count
end
local module = {}

function module.valid(word)
  local track = {}
  local brackets = {
    ['}']=1,
    ['{']=2,
    [')']=3,
    ['(']=4,
    [']']=5,
    ['[']=6,
  }
  local conn = {
    ['}']='{',
    ['{']='}',
    [')']='(',
    ['(']=')',
    [']']='[',
    ['[']=']',
  }
  
  for i=1,#word do
    local chr = word:sub(i, i)
    local code = brackets[chr]
    if code ~= nil then  -- it is a bracket
      if code % 2 == 0 then  -- open
        table.insert(track, chr)
      elseif track[#track] == conn[chr] then
        table.remove(track, #track)
      else return false end
    end
  end
  return #track == 0
end

return module
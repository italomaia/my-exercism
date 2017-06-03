local M = {}

local function beer(bottles)
  if bottles == 0 then
    return 'No more bottles of beer on the wall, no more bottles of beer.\n' ..
    'Go to the store and buy some more, 99 bottles of beer on the wall.\n'
  end
  return
    bottles .. ' bottle'.. (bottles==1 and '' or 's') ..' of beer on the wall, ' ..
    bottles .. ' bottle'.. (bottles==1 and '' or 's') ..' of beer.' ..
    '\nTake ' .. (bottles==1 and 'it' or 'one') ..
    ' down and pass it around, ' ..
    (bottles==1 and 'no more' or (bottles-1)) .. ' bottle'.. 
    (bottles==2 and '' or 's') ..' of beer on the wall.\n'
end

function M.verse (bottles)
  return M.sing(bottles, bottles)
end

function M.sing (from, to)
  local rs = {}
  to = to or 0
  for i=from,to,-1 do
    table.insert(rs, beer(i))
  end
  return table.concat(rs, '\n')
end

return M
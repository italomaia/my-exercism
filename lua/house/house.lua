local module = {}

local verse = {
  "This is",
  "the house that Jack built."
}

local things = {
  {"the malt", "that lay in"},
  {"the rat", "that ate"},
  {"the cat", "that killed"},
  {"the dog", "that worried"},
  {"the cow with the crumpled horn", "that tossed"},
  {"the maiden all forlorn", "that milked"},
  {"the man all tattered and torn", "that kissed"},
  {"the priest all shaven and shorn", "that married"},
  {"the rooster that crowed in the morn", "that woke"},
  {"the farmer sowing his corn", "that kept"},
  {"the horse and the hound and the horn", "that belonged to"}
}

function module.verse(num)
  local rt = {}

  for i=num,2,-1 do
    table.insert(rt, things[i-1][1] .. '\n' .. things[i-1][2] .. ' ')
  end

  return verse[1] .. ' ' .. table.concat(rt, '') .. verse[2]
end

function module.recite()
  local rt = {}
  for i=1,#things+1 do
    table.insert(rt, module.verse(i))
  end
  return table.concat(rt, '\n')
end

return module
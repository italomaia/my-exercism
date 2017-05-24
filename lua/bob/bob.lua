local module = {}

local answers = {
  [[Sure]],  -- question?
  [[Whoa, chill out!]],  -- yell
  [[Fine, be that way.]],  -- say anything
  [[Whatever]]  -- anything else
}

function module.hey(msg)
  if msg:sub(#msg, #msg) == '?' then
    return answers[1]
  end

  if msg == '' then
    return answers[3]
  end

  if msg:upper() == msg then
    return answers[2]
  end

  return answers[4]
end

return module
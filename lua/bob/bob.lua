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

  local is_yell = true
  for i=1,#msg do
    local code = msg:byte(i, i)
    if code >= 97 and code <= 122 then
      is_yell = false
    end
  end
  if is_yell then
    return answers[2]
  end

  return answers[4]
end

return module
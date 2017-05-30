function octal(oct_str)
  local cls = {}

  function cls.to_decimal()
    if oct_str == nil or oct_str:match('[^01234567]') ~= nil then
      return 0
    end

    local len = #oct_str
    local dec = 0
    for i=1, len do
      dec = dec + math.pow(8, len-i) * tonumber(oct_str:sub(i, i))
    end
    return dec
  end
  return cls
end

return octal
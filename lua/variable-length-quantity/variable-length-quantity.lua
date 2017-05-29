local module = {}

function bits_to_number(bits)
  -- translate an bit array into an integer
  return tonumber(table.concat(bits, ''), 2)
end

function number_to_bits(num)
  -- translates an unsigned integer to its binary representation
  if num == 0 then
    return {0}
  else
    local rt = {}
    while num > 0 do
      -- insert in first position
      table.insert(rt, 1, num % 2)
      num = num >> 1
    end
    return rt
  end
end


function module.encode(list)
  local list_of_bits = {}
  for _, v in ipairs(list) do
    table.insert(list_of_bits, number_to_bits(v))
  end
  
  local rt = {}
  for i=#list_of_bits,1,-1 do
    local byte = {}
    local bits = list_of_bits[i]
    local smb = 0
    
    -- for each input number
    for j=#bits,1,-1 do
      table.insert(byte, 1, bits[j])
      
      if #byte % 7 == 0 then
        -- we have a byte, folks!
        table.insert(byte, 1, smb)
        table.insert(rt, 1, bits_to_number(byte))
        byte = {}
        smb = 1
      end
    end
    
    if #byte ~= 0 then  -- something left?
      while #byte < 7 do
        table.insert(byte, 1, 0)
      end
      table.insert(byte, 1, smb)
      table.insert(rt, 1, bits_to_number(byte))
    end
  end
  return rt
end

function module.decode(list)
  local rt = {}
  local bits = {}
  local smb = 0
  for _, num in ipairs(list) do
    byte = number_to_bits(num)
    
    while #byte < 8 do
      table.insert(byte, 1, 0)
    end
    
    for i=2,#byte do
      table.insert(bits, byte[i])
    end
    
    smb = byte[1]
    if smb == 0 then
      table.insert(rt, bits_to_number(bits))
      bits = {}
    end
  end
  
  -- were we still expecting more input?
  if smb == 1 then error('incomplete byte sequence') end
  return rt
end

return module
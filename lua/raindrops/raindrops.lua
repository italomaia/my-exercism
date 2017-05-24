function raindrops(n)
  rt = ''

  if n % 3 == 0 then
    rt = rt .. 'Pling'
  end
  if n % 5 == 0 then
    rt = rt .. 'Plang'
  end
  if n % 7 == 0 then
    rt = rt .. 'Plong'
  end
  if rt == '' then
    return tostring(n)
  else
    return rt
  end
end

return raindrops
return function (w)
  local n = {}
  local matrix = {}
  local row = {}

  local function add(r, n)
    table.insert(r, tonumber(table.concat(n, '')))
  end

  for i=1,#w do
    local chr = w:sub(i, i)
    local code = string.byte(chr)
    
    if code == 10 then  -- \n
      -- end row
      n = add(row, n) or {}
      table.insert(matrix, row)
      row = {}
    elseif code == 32 then  --
      -- add to row
      n = add(row, n) or {}
    else
      table.insert(n, chr)
    end
  end

  if #n then add(row, n) end
  if #row then table.insert(matrix, row) end
  
  function matrix.row (index)
    return matrix[index]
  end
  function matrix.column (index)
    local col = {}
    for i=1,#matrix do table.insert(col, matrix[i][index]) end
    return col
  end
  return matrix
end
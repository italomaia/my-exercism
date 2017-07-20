return function (w)
  local matrix = {}

  for line in (w..'\n'):gmatch '.-\n' do
    local row = {}
    for num_str in line:gmatch '%d+' do
      table.insert(row, tonumber(num_str))
    end
    table.insert(matrix, row)
  end

  function matrix.row (index) return matrix[index] end
  function matrix.column (index)
    local col = {}
    for i=1, #matrix do table.insert(col, matrix[i][index]) end
    return col
  end

  return matrix
end

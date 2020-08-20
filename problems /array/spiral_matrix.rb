def spiral_matrix(size)
	counter = 1
	start_column = 0
	end_column = size - 1 

	start_row = 0
	end_row = size - 1
	count = 0

	array = Array.new(size).map{|k| Array.new(size)}

	while count <= ((size*size) - 1)

		for i in (start_column..end_column)
			count = count + 1
			array[start_row][i] = count 
		end

		start_row = start_row + 1

		for i in (start_row..end_row)
			count = count + 1
			array[i][end_column] = count
		end

		end_column = end_column - 1

		end_column.downto(start_column).each do |i|
			count = count + 1
			array[end_row][i] = count 
		end

		end_row = end_row - 1

		end_row.downto(start_row).each do |i|
			count = count + 1
			array[i][start_column] = count
		end

		start_column = start_column + 1
		end
	return array
end
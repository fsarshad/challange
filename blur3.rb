class Image


	def initialize (argument) 
		@picture=argument
	end

	def output_image
		@picture.each do |row|
			print row.join, "\n" 
		end
	end

	def blur
		ones = []
		@picture.each_with_index do |row, row_number|
			#print "row=", row, "   row index=", row_number, "\n" 
			row.each_with_index do |column, column_number|
				#print "column=", column, "   column index=", column_number, "\n" 
				if column == 1 
					ones << [row_number, column_number] 
				end
			end
		end
		#print ones , "\n"
		maxrow_index = @picture.length - 1 
		ones.each do |row, column|
			maxcolumn = @picture[row].length - 1
			if column > 0 
				@picture[row] [column-1] = 1 #chenged value to left 
			end
			if row > 0 
				@picture[row-1] [column] = 1 #changed value to above
			end
			if row < maxrow_index  
				@picture[row+1] [column] = 1 #changed value to below
			end
		
			if column < maxcolumn
				@picture[row] [column+1] = 1 #changed value to right
			end 
		end
	end



end

puts "what is the manhattandistance?"
manhattandistance = gets
manhattandistance.chomp
manhattandistance = manhattandistance.to_i
image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0]
])
while manhattandistance > 0
 image.blur 
 manhattandistance = manhattandistance -1 
end 
image.output_image 



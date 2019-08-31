class Image


	def initialize (argument) 
		@picture=argument
	end

	def output_image
		@picture.each do |row|
			print row.join, "\n" 
		end
	end


end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image

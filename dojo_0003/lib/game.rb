class Game

	def initialize
		@clouds = []
		@airports = []
	end

	def put_cloud(row, clouds)
		@clouds[row] = clouds
	end

	def put_airport(row, airports) 
		@airports[row] = airports
	end

	def day_when_first_airport_under_clouds

		positions = []
		@airports.each_with_index do |airport, x|
			if airport
				y = airport.first
				positions << verifyHorizontally(x, y)
				positions << verifyVertically(x, y)
			end
		end
		min(positions) + 1
	end

	def verifyHorizontally(x, y)
		positions = []

		if @clouds[x]
			@clouds[x].each do |cloud|
				positions << (cloud - y).abs 
			end
		end
		min(positions)
	end

	def verifyVertically(x, y)
		positions = []

		@clouds.each_with_index do |clouds_row, i|
			positions << (i - x).abs if clouds_row[y]
		end
		min(positions)
	end

	def min(array)
		lowest_number = 9999;
		array.each do |array|
			if (array < lowest_number)
				lowest_number = array
			end
		end

		lowest_number
	end

end
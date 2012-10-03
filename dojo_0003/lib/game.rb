class Game

	FIRST_DAY = 1

	def initialize
		@clouds = []
		@airports = []
	end

	def put_cloud(*pos)
		@clouds << pos
	end

	def put_airport(*pos)
		@airports << pos
	end

	def reach_the_first_airport_on_day
		closest_cloud_distances_for_each_airport.min + FIRST_DAY
	end

	def reach_the_last_airport_on_day
		closest_cloud_distances_for_each_airport.max + FIRST_DAY
	end

	def closest_cloud_distances_for_each_airport
		@airports.map { |airport| closest_cloud_distance(airport) }
	end

	def closest_cloud_distance(airport)
		@clouds.map { |cloud| distance(airport, cloud) }.min
	end

	def distance(p1, p2)	
		p1.each_with_index.map { |x, i| (x - p2[i]).abs }.inject(:+)
	end

end

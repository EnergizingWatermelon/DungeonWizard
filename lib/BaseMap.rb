#Author: Shane McDermott
#Created On: Jul 03, 2016

# Base Map class, contains common functions for map generation
class BaseMap

	# Grid that is used for all maps being generated
	attr_reader :grid
	attr_reader :height
	attr_reader :width

	# Constructor
	def initialize(height = 24, width = 32)
		@height = height
		@width = width
		@grid = Array.new(height){Array.new(width, :open)}
	end

	# Populates map with white noise
	#
	# ==== Attributes
	# * +wallRatio+ - ratio of Walls to Open spaces
	def randomize(wallRatio = 0.4)
		for x in 0...@height  do
			for y in 0...@width do
				@grid[x][y] = rand > wallRatio ? :open : :wall
			end
		end
	end
	
	# returns true if passed coordinates are within the map bounds
	#
	# ==== Attributes
	# * +x+ - x-coordinate to check
	# * +y+ - y-coordinate to check
	def isInBounds(x,y)
		return x >= 0 && y >= 0 && x < @height && y < @width
	end

	# Returns colored string representation of grid for console output
	def to_s
		str = ""
		@height.times do |y|
			@width.times do |x|
				case @grid[y][x]
				when :open
					str << "\033[48;5;22m \033[0m"
				when :wall
					str << "\033[48;5;94m \033[0m"
				when :water
					str << "\033[48;5;23m \033[0m"
				end
			end
			str << "\n"
		end
		return str
	end

end

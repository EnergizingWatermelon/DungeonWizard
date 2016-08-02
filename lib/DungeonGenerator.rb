#Author: Shane McDermott
#Created On: Jun 12, 2016

# Generates a map
class DungeonGenerator
	attr_reader :height
	attr_reader :width
# Constructor
#
# ==== Attributes
# * +height+ - height of the Map
# * +width+ - width of the Map
	def initialize(height = 32, width = 24)
		@height = height
		@width = width
		@numberOfEncounters = 0
		@grid = Array.new(@height){Array.new(@width, :wall)}
	end

	# Generates a grid-based map composed of connected rooms
	#
	# * Returns a grid of rooms and passages
	def createGrid
		addRoom
		return @grid
	end

	#TODO: Add Gap for Walls?
	# Checks for walls, given two corner coordinates
	#
	# ==== Attributes
	# * +x0+ - top-left x coordinate
	# * +y0+ - top-left y coordinate
	# * +x1+ - bottom-right x coordinate
	# * +x2+ - bottom-right y coordinate
	private def isSpaceAvailable(x0,y0,x1,y1)
		if(x0 >= 0 && y0 >= 0 && x1 < @height && y1 < @width)
			for x in x0..x1 do
				for y in y0..y1 do
					if(@grid[x][y] != :wall)
						return false
					end
					#This should be checking for walls to be added across from 
					#the current room but it is not working
					if(@grid[x][y-1] != :wall or @grid[x][y+1] != :wall)
						return false
					end
					#This seems to be working for checking if a room is above
					#the current room being added
					begin
						if(@grid[x-1][y] != :wall or @grid[x+1][y] != :wall)
						return false
						end
					rescue Exception
						return false
					end
					
				end
			end

			return true
		end
		return false
	end

	# Recursively adds rooms when space is available
	#
	# ==== Attributes
	# * +x+ - x coordinate
	# * +y+ - y coordinate
	# * +rmHeight+ -height of room
	# * +rmWidth+ -width of room
	private def addRoom(x = 0, y = 0, rmHeight = rand(4..6), rmWidth = rand(4..6))
			xBounds = x+rmHeight
			yBounds = y+rmWidth
			if(isSpaceAvailable(x,y,xBounds,yBounds))
				addSection((x..xBounds), (y..yBounds), :open)
				@numberOfEncounters += 1
			
				#Add South Rooms
				nextX = xBounds + rand(2..4)
				nextY = y + rand(2..4)
				addLinkedRoom(	nextX, 
								y, 
								(xBounds + 1...nextX),
								(nextY..nextY)
				)
						  
				#Add East Rooms
				nextX = x + rand(2..4)
				nextY = yBounds + rand(2..4)
				addLinkedRoom(	x,
								nextY,
								(nextX..nextX),
								(yBounds + 1...nextY)
				)
				return true
			end
		return false
	end
	
	# Adds a room as well as a passage to connect them
	private def addLinkedRoom(x,y,passageX, passageY)
		if(addRoom(x,y))
			addSection(passageX, passageY)
		end
	end

	# Fills in a square
	private def addSection(xRange, yRange, type = :open)
		for rx in xRange do
			for ry in yRange do
				@grid[rx][ry]=type
			end
		end
	end
	
	# Returns string representation of grid
	def to_s
		str = ""
		@height.times do |y|
			@width.times do |x|
				str << @grid[y][x]
			end
			str << "\n"
		end
		return str
	end
end



#Author: Shane McDermott
#Created On: Jun 21, 2016 MapGenerator

# Used to generate maps
module MapGenerator

	# Creates a map of an apporpriate type.
	#
	# ==== Attributes
	# * +seed+ - integer seed for rng
	# * +terrain+ - string value that determines algorithm to use. Distinguishable ptions are 'Cave' and 'Dungeon'.
	def MapGenerator.generateMap(seed, terrain)
		srand(seed)
		case terrain
			when 'Cave'
				return MapGenerator.generateCave(32,24)
			when 'Dungeon'
				return MapGenerator.generateDungeon(32,24)
			else
				return MapGenerator.generateNatural(32,24)
		end
	end

	# Generates caves by carving out passages
	def MapGenerator.generateCave(height, width)
		grid = Array.new(height){Array.new(width, :wall)}
		reps = 1000
		#Informs the controller how to adjust x and y, given a direction
		xdir = [1,0,-1,0]
		ydir = [0,1,0,-1]
		
		#controller location
		cx = [0,height-1].sample
		cy = [0,width-1].sample

		#controller direction
		cdir = rand(0..3)
		chance_to_change = 0.25

		reps.times do
			grid[cx][cy] = :room
			if(rand() > chance_to_change)
				cdir = rand(0..3)			
			end
			cx += xdir[cdir]
			cy += ydir[cdir]
			
			#Keep the controller in bounds
			if(cx < 0)
				cx = 0
			elsif(cx >=height)
				cx = height-1
			end
			
			if (cy < 0)
				cy = 0
			elsif(cy >=width)
				cy = width-1
			end
		end
		
		return grid
	end

	# Original dungeon algorithm - generates branching rooms
	require 'DungeonGenerator'
	def MapGenerator.generateDungeon(height, width)
		generator = DungeonGenerator.new(height,width)
		return generator.createGrid
	end

	# Creates natural spaces with cellular automata rules
	require 'NatureMap'
	def MapGenerator.generateNatural(height, width)
		map = NatureMap.new(height,width)
		map.generateCave
		return map.grid
	end
end
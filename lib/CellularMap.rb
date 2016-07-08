#Author: Shane McDermott
#Created On: Jul 03, 2016

require 'BaseMap'
# Map sublcass utilizing cellular automata for map generation
class CellularMap < BaseMap


    # Generates a cave using Automata rules 
    # suggested by http://www.roguebasin.com/index.php?title=Cellular_Automata_Method_for_Generating_Random_Cave-Like_Levels
    def generateCave
       firstReps = 4
       secondReps = 3
       
       randomize
       
       firstReps.times do 
           generateNext(5,2)
       end
       
       secondReps.times do
           generateNext(5,-1)
       end
        
    end

    # Counts neighboring cells of a given distance for a specific type
    #
    # ==== Attributes
    # * +gx+ - grid x coordinate
    # * +gy+ - grid y coordinate
    # * +type+ - symbol to count
    # * +distance+ - distance from (gx,gy) to count. Default is 1.
    # * +bIncludeBounds+ - Whether or not to add out of bounds locations to count. Default is true.
    # * +bIncludeSelf+ - Whether or not to include (gx,gy) in the count. Default is true.
    def countNeighboringType(gx, gy, type, distance = 1, bIncludeBounds = true, bIncludeSelf = true)
	    typeCount = 0
	    for x in gx-distance..gx+distance do
		    for y in gy-distance..gy+distance do
			    if isInBounds(x,y)
				    if @grid[x][y] == type
					    unless x == gx and y == gy and not bIncludeSelf
						    typeCount += 1
					    end
				    end
			    elsif bIncludeBounds
				    typeCount += 1
			    end
		    end
	    end
	    return typeCount 
    end

    # Uses Cellular Automata rules to produce next generation of map
    #
    # ==== Attributes
    # * +immediateMinCount+ - Minimum number of walls within 1 square of a point to set it to a wall
    # * +outerMaxCount+ - Maximum number of walls within 2 squares of a point to set it to a wall
    #
    # TODO - Adjust parameters so that rules can be passed
    def generateNext(immediateMinCount = 5, outerMaxCount = 2)
	
	    #Holds values for next generation
	    temp = Array.new(@height){Array.new(@width)}


	    for x in 0...@height do
		    for y in 0...@width do 
			    neighbors = countNeighboringType(x,y,:wall,1)
			    neighbors2 = countNeighboringType(x,y,:wall,2, false)
			    if neighbors >= immediateMinCount  # || neighbors2 <= outerMaxCount
				    temp[x][y] = :wall
			    elsif neighbors2 <= outerMaxCount
				    temp[x][y] = :wall
			    else
				    temp[x][y] = :open
			    end
		    end
	    end

	    #copy temp back into grid
	    @height.times do |x|
		    @width.times do |y|
			    @grid[x][y] = temp[x][y]	
		    end
	    end
    end


end
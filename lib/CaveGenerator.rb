#Author: Shane McDermott
#Created On: Jun 21, 2016 CaveGenerator

#Used to generate more "natural" feeling dungeons
module CaveGenerator

	def CaveGenerator.generate(height = 32, width = 24)
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

end

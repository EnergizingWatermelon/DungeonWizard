require 'MapGenerator'

# Controller class for Adventures
class AdventuresController < ApplicationController
    
    def index
    end
    
    def new
        @adventure = Adventure.new
    end
  
    def create
        @adventure = Adventure.new(adventure_params)
        if (@adventure.save)
            @adventure.map = Map.new(map_params)
            if(@adventure.save)
                redirect_to @adventure
            else
                redirect_to '/adventures'
            end
        else
            redirect_to '/adventures'
        end
    end
    
    def show
        @adventure = Adventure.find(params[:id])
        @grid = MapGenerator.generateMap(@adventure.map.seed, @adventure.map.terrain)
    end

  private
    def adventure_params
      params.require(:adventure).permit(:title, :plot, :party_size, :cr)
    end
    
  private
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end
end
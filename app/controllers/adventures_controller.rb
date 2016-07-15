require 'MapGenerator'

# Controller class for Adventures
class AdventuresController < ApplicationController
    
    # Displays adventure creation form
    def index
    end
    
    # Creates a new Adventure
    def new
        @adventure = Adventure.new
    end
  
    # Checks receives parameters and attempts to create a new Adventure and Map. 
    # If the adventure or map fail to save to the database for whatever reason, the user is redirected to the index.
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
    
    # Displays the Adventure specified in the id parameter
    def show
        @adventure = Adventure.find(params[:id])
        @grid = MapGenerator.generateMap(@adventure.map.seed, @adventure.map.terrain)
    end

  # Validates all necessary parameters for Adventures
  private
    def adventure_params
      params.require(:adventure).permit(:title, :plot, :party_size, :cr)
    end
    
  # Validates all necessary parameters for Maps
  private
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end
end
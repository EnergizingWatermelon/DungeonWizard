require 'MapGenerator'

# Controller class for Maps
class MapsController < ApplicationController
  
  # Displays the map requested by the id parameter
  def show
    @map = Map.find(params[:id])
    @grid = MapGenerator.generateMap(@map.seed, @map.terrain)
  end
  
  # Contains a form for map creation
  def index
  end
  
  # Attempts to create a map with the given parameters. If the map fails to save, the user is redirected to the index
  def create
    @map = Map.new(map_params)
      if(@map.save)
          redirect_to @map
      else
        redirect_to '/maps'
      end
  end

  # Creates a new map
  def new
  end
  
  # Destroys a map with the given id
  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to '/maps'
  end
  
  # Validates map parameters necessary for map creation
  private
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end
end

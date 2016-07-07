require 'MapGenerator'

class MapsController < ApplicationController
  
  def show
    @map = Map.find(params[:id])
    @grid = MapGenerator.generateMap(@map.seed, @map.terrain)
  end
  
  def index
  end
  
  def create
    @map = Map.new(map_params)
      if(@map.save)
          redirect_to @map
      else
        render 'new'
      end
  end

  def new
  end
  
  def destroy
    @map = Map.find(params[:id])
    @map.destroy
    redirect_to maps_path
  end
  
  private
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end
end

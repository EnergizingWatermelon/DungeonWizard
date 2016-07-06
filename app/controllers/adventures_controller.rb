require 'MapGenerator'

# Controller class for Adventures
class AdventuresController < ApplicationController
    
    def character_params
        params.require(:character).permit(:terrain, :climate)
    end
  
    def index
        @grid = MapGenerator.generateDungeon
    end
end

require 'MapGenerator'

# MapsController: Controller for Maps
class MapsController < ApplicationController
    
    # (Currently) Generates a map
    def index
        @grid = MapGenerator.generateDungeon
    end
    
    def cave
        @grid = MapGenerator.generateCave
    end
    
end

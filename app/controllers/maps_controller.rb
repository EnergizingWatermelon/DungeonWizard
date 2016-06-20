require 'MapGenerator'

# MapsController: Controller for Maps
class MapsController < ApplicationController
    
    # (Currently) Generates a map
    def index
        generator = MapGenerator.new
        @grid = generator.createGrid
    end
    
end

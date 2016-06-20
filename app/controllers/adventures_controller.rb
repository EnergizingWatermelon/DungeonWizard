# Controller class for Adventures
class AdventuresController < ApplicationController
    
    def index
        generator = MapGenerator.new
        @grid = generator.createGrid
    end
end

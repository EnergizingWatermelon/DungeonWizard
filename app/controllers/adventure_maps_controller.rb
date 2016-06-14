class AdventureMapsController < ApplicationController
    helper_method :generate_map, :get_map_cell
    
    require 'MapGenerator'
    def generate_map
        @map = MapGenerator.new
        @map.createMap;
    end
    
    def get_map_cell(row,col)
        @map.getCell(row,col)
    end
    
    def index
        generate_map
    end
    
end

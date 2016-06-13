class AdventureMapController < ApplicationController
    helper_method :generate_map, :get_map_cell
    
    require 'AdventureMap'
    def generate_map
        @map = AdventureMap.new
        @map.createMap;
    end
    
    def get_map_cell(row,col)
        @map.getCell(row,col)
    end
end

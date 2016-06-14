require 'MapGenerator'

# MapsController: Controller for Maps
class MapsController < ApplicationController
    
    # Method currently used for html output
    helper_method :get_map_cell
    
    # Reads a cell from generated map
    #
    # ==== Attributes
    #
    # * +row+ - the row of the cell within the map to read.
    # * +col+ - the column of the cell within the map to read.
    def get_map_cell(row,col)
        @map.getCell(row,col)
    end
    
    # (Currently) Generates a map
    def index
        @map = MapGenerator.new
        @map.createMap
    end
    
end

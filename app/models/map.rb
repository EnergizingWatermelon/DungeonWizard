# Map model
class Map < ActiveRecord::Base
    belongs_to :adventure
    
    # Returns the file location of the appropriate terrain tile
    # 
    # ==== Attributes
    # * +terrain+ - Terrain type
    def self.get_tile_name(terrain)
        terrain_tile = "tiles/landscape/tile"
        terrain_tile << terrain.to_s
        terrain_tile << ".png" 
    end
    
    # Returns the file location of the appropriate unplayable tile
    #
    # ==== Attributes
    # * +climate+ - Climate type
    def self.get_unplayable_name(climate)
       if(climate == "Warm" or climate == "Cold")
           return "tiles/cells/tileUnplayable2.png"
       else
           return "tiles/cells/tileUnplayable.png"
       end
    end
end

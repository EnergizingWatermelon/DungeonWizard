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
end

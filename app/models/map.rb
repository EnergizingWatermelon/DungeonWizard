# Map model
class Map < ActiveRecord::Base
    belongs_to :adventure
    
    def self.get_tile_name(terrain)
        terrain_tile = "tiles/landscape/tile"
        terrain_tile << terrain.to_s
        terrain_tile << ".png" 
    end
end

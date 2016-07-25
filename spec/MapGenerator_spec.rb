require 'MapGenerator'

describe MapGenerator do
    it 'should return a nonempty grid for a generateCave call when Terrain is Cave' do
        terrain = 'Cave'
        map = MapGenerator.generateMap(19, terrain)
        expect(map).to_not eq([])
    end
    it 'should return a nonempty grid for a generateDungeon call when Terrain is Dungeon' do
        terrain = 'Dungeon'
        map = MapGenerator.generateMap(19, terrain)
        expect(map).to_not eq([])
    end
    it 'should return a nonempty grid for a generateNatural call when Terrain is any other value' do
        terrain = 'Value'
        map = MapGenerator.generateMap(19, terrain)
        expect(map).to_not eq([])
    end
end
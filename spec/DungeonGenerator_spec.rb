require 'DungeonGenerator'

describe DungeonGenerator do
    it 'should return a nonempty grid' do
        map = DungeonGenerator.new()
        expect(map.createGrid).to_not eq([])
    end
    it 'should have appropriate heights and widths' do
        map = DungeonGenerator.new()
        expect(map.height).to eq(32)
        expect(map.width).to eq(24)
    end
end
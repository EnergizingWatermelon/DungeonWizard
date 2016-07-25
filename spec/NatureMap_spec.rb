require 'NatureMap'

describe NatureMap do
    it 'should return a nonempty grid' do
        height = 32
        width = 24
        map = NatureMap.new(height,width)
		map.generateCave
        expect(map.grid).to_not eq([])
    end
    it 'should have correct height and width' do
        height = 32
        width = 24
        map = NatureMap.new(height,width)
        expect(map.height).to eq(32)
        expect(map.width).to eq(24)
    end
end
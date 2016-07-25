require 'BaseMap'

describe BaseMap do
    it 'should return a valid map object' do
        height = 32
        width = 24
        map = NatureMap.new(height,width)
        expect(map.grid).to_not eq([])
        expect(map.height).to eq(32)
        expect(map.width).to eq(24)
    end
end
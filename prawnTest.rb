#Author: Shane McDermott
#Created On: Jun 14, 2016
require 'prawn'
require_relative 'lib/MapGenerator'

    map = MapGenerator.new
    map.createMap;
    prev = nil;
    scale = 8

Prawn::Document.generate("dungeon.pdf") do
    self.line_width = scale;
    map.rooms.each do |room|
        rectangle [room.x*scale, room.y*scale], room.width*scale, room.height*scale
        fill
        unless(prev.nil?)
            line [prev.x+prev.width * scale, prev.y+prev.height * scale], [room.x*scale, room.y*scale]
            stroke
        end
        prev = room
    end
    
end
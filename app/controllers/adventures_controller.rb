require 'MapGenerator'

# Controller class for Adventures
class AdventuresController < ApplicationController
    def index
        @grid = MapGenerator.generateDungeon
    end
end

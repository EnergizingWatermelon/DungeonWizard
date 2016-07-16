# A single encounter(combat, trapped room, puzzle...) within a game session
class Encounter < ActiveRecord::Base
    has_and_belongs_to_many :characters
    
    def self.calculateCharacters(xp, climate, terrain)
        sum = 0
       characters = Array.new
        #Gather a collection of characters that can spawn in this area and whose CR will not exceed the total value
        while sum < xp
            options = Character.where("cr <= ?", xp - sum)
                                  .where("climate == ?", climate)
                                  .where("terrain == ?", terrain)
            character = options.sample
            sum += character.xp
            characters << character
        end 
        return characters
    end
end

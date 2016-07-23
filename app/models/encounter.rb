# A single encounter(combat, trapped room, puzzle...) within a game session
class Encounter < ActiveRecord::Base
    has_and_belongs_to_many :characters
    
    def self.calculateExperienceReward(party_level, party_size, multiplier = 1.0)
         return multiplier * experience_reward( adjust_party_level(party_level, party_size) )
    end
    
    
  # Returns the appropriate experience reward for a given challenge rating
  protected
    def self.experience_reward(challenge_rating)
        experience={0 => 0,
                    1 => 400,
                    2 => 600,
                    3 => 800,
                    4 => 1200,
                    5 => 1600,
                    6 => 2400,
                    7 => 3200,
                    8 => 4800,
                    9 => 6400,
                    10 => 9600,
                    11 => 12800,
                    12 => 19200,
                    13 => 25600,
                    14 => 38400,
                    15 => 51200,
                    16 => 76800,
                    17 => 102400,
                    18 => 153600,
                    19 => 204800,
                    20 => 307200,
                    21 => 409600,
                    22 => 614400,
                    23 => 819200,
                    24 => 1228800,
                    25 => 1638400
        }
        xp_amount = 0
        cr_floor = challenge_rating.to_f.floor
        cr_ceil = challenge_rating.to_f.ceil
        if(cr_ceil <= 25 && cr_floor >= 0)
            xp_amount = experience[cr_floor] +(experience[cr_ceil] - experience[cr_floor]) *  ((challenge_rating.to_f - cr_floor)/(cr_ceil - cr_floor))
        end
        return xp_amount.round
    end
    
  # Adjusts average party level based on party size, per Pathfinder's suggestion
    def self.adjust_party_level(party_level, party_size)
        if party_size.to_i > 6
            party_level = party_level + 1
        elsif party_size.to_i < 4
            party_level = party_level - 1
        end
        return party_level
    end
    
    def self.calculateCharacters(xp, climate, terrain)
        sum = 0
        characters = Array.new
        #Gather a collection of characters that can spawn in this area and whose CR will not exceed the total value
        while sum < xp
            options = Character.where("cr <= ?", xp - sum)
                                  .where("climate == ?", climate)
                                  .where("terrain == ?", terrain)
            if options.empty?
                return characters
            end
            character = options.sample
            sum += character.xp
            characters << character
        end 
        return characters
    end
end

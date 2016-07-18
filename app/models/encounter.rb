# A single encounter(combat, trapped room, puzzle...) within a game session
class Encounter < ActiveRecord::Base
    has_and_belongs_to_many :characters
    
    def self.calculateExperienceReward(party_level, party_size, multiplier = 1.0)
         return multiplier * experience_reward( adjust_party_level(party_level, party_size) )
    end
    
    
  # Returns the appropriate experience reward for a given challenge rating
  protected
    def self.experience_reward(challenge_rating)
        experience={0.125 => 50,
                    0.166 => 65,
                    0.25 => 100,
                    0.333 => 135,
                    0.5 => 200,
                    1.0 => 400,
                    2.0 => 600,
                    3.0 => 800,
                    4.0 => 1200,
                    5.0 => 1600,
                    6.0 => 2400,
                    7.0 => 3200,
                    8.0 => 4800,
                    9.0 => 6400,
                    10.0 => 9600,
                    11.0 => 12800,
                    12.0 => 19200,
                    13.0 => 25600,
                    14.0 => 38400,
                    15.0 => 51200,
                    16.0 => 76800,
                    17.0 => 102400,
                    18.0 => 153600,
                    19.0 => 204800,
                    20.0 => 307200,
                    21.0 => 409600,
                    22.0 => 614400,
                    23.0 => 819200,
                    24.0 => 1228800,
                    25.0 => 1638400
        }
        return experience[challenge_rating] || 0
    end
    
  # Adjusts average party level based on party size, per Pathfinder's suggestion
    def self.adjust_party_level(party_level, party_size)
        if party_size.to_i > 6
            party_level += 1
        elsif party_size.to_i < 4
            party_level -= 1
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
            character = options.sample
            sum += character.xp
            characters << character
        end 
        return characters
    end
end

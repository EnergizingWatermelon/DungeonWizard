# A single encounter(combat, trapped room, puzzle...) within a game session
class Encounter < ActiveRecord::Base
    has_and_belongs_to_many :characters
    
    
    # Calculated experience reward for adjusted party size
    # ==== Attributes
    # * +party_level+ - Average level of party members
    # * +party_size+ - Number of party members
    # * +multiplier+ - Optional multiplier for experience scaling.
    def self.calculateExperienceReward(party_level, party_size, multiplier = 1.0)
         return multiplier * experience_reward( adjust_party_level(party_level, party_size) )
    end
    
    
    # Returns the appropriate experience reward for a given challenge rating
    # 
    # ==== Attributes
    # * +challenge_rating+ - Challenge Rating to determine experience for
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
        
        if cr_floor != cr_ceil
            #lerp experience rewards
            xp_floor = experience[cr_floor]
            xp_ceil = experience[cr_ceil]
            xp_amount = xp_floor + (xp_ceil - xp_floor) *  ((challenge_rating.to_f - cr_floor)/(cr_ceil - cr_floor))
        else
            xp_amount = experience[cr_floor]
        end
        
        return xp_amount
    end
    
  # Adjusts average party level based on party size, per Pathfinder's suggestion
  #
  # ==== Attributes
  # * +party_level+ - Average level of party members
  # * +party_size+  - Number of party members
  # 
  # returns recommended party_level
    def self.adjust_party_level(party_level, party_size)
        size = party_size.to_i
        level = party_level.to_f
        if size > 6
            level = level + 1
        elsif size < 4
            if level == 1
                level = 0.5
            else
                level = level - 1
            end
        end
        challenge_rating = level
        return challenge_rating
    end
    
    # Generates encounter appropriate characters
    #
    # ==== Attributes
    # * +xp_total+ - desired experience total
    # * +climate+  - desired climate
    # * +terrain+  - desired terrain
    #
    # Returns an array of Characters for the Encounter
    def self.calculateCharacters(xp_total, climate, terrain)
        xp_sum = 0
        characters = Array.new
        #Gather a collection of characters that can spawn in this area and whose CR will not exceed the total value
        while xp_sum < xp_total
                options = Character.where("xp <= ? AND terrain == ?", xp_total - xp_sum, terrain)
            unless(climate == 'Any')
                options = options.select { |a| a.climate == climate || a.climate == 'Any' }
            end
            
            if options.empty?
                return characters
            else
                #Add either a random monster or the most difficult one
                options.sort{ |x,y| x.xp <=> y.xp }
                character = [options.last, options.last, options.sample].sample
                xp_sum += character.xp
                characters << character
               
               #skip organizations if there's no info
                next if character.organization.nil?
                #Add pair,gang,pack,nest support
                nest_odds = 0.1
                nest_size = rand(17..30)
                nest_xp = character.xp * nest_size
                
                pack_odds = 0.2
                pack_size = rand(10..16)
                pack_xp = character.xp * pack_size
                
                gang_odds = 0.3
                gang_size = rand(3..9)
                gang_xp = character.xp * gang_size
                
                pair_odds = 1.0
                if character.organization.include? "solitary"
                    pair_odds = 0.5
                end
                
                odds = rand
                
                if odds <= nest_odds and
                nest_xp + xp_sum <= xp_total and 
                ( character.organization.include? "nest" or character.organization.include? "tribe" or character.organization.include? "clan" )
                    nest_size.times do
                       characters << character
                    end
                    xp_sum += nest_xp
                elsif odds <= pack_odds and pack_xp + xp_sum <= xp_total and 
                (character.organization.include? "pack" or character.organization.include? "warband")
                    xp_sum += pack_xp
                    pack_size.times do
                       characters << character
                    end
                elsif odds <= gang_odds and
                gang_xp + xp_sum <= xp_total and
                character.organization.include? "gang"
                    xp_sum += gang_xp
                    gang_size.times do
                        characters << character
                    end
                elsif odds <= pair_odds and
                character.organization.include? "pair"  and 
                character.xp + xp_sum <= xp_total
                    characters << character
                    xp_sum += character.xp
                end

            end
        end
      
        return characters
    end
    
end

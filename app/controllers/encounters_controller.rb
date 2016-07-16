# Controller class for Encounters
class EncountersController < ApplicationController
    
    # Creates a new Encounter
    def new
        @encounter = Encounter.new
    end
  
    # Checks receives parameters and attempts to create a new Encounter
    # If the encounter fails to save to the database for whatever reason, the user is redirected to the index.
    # TODO: Improve this substantially. This is just a proof of concept.
    def create
        @encounter = Encounter.new(encounter_params)
        @encounter.xp = experience_award(adjust_party_level(@encounter.cr, @encounter.party_size))
 
        xp = 0
        #Gather a collection of characters that can spawn in this area and whose CR will not exceed the total value
        while xp < @encounter.xp
            characters = Character.where("cr <= ?", total - xp)
                                  .where("climate == ?", @encounter.climate)
                                  .where("terrain == ?", @encounter.terrain)
            character = characters.sample
            xp += character.xp
            @encounter.characters << character
        end
        
        
        if(@encounter.save)
            redirect_to @encounter
        else
            redirect_to '/encounters'
        end
    end
    
    # Displays the Encounter specified in the id parameter
    def show
        @encounter = Encounter.find(params[:id])
    end

  # Validates all necessary parameters for Encounters
  private
    def encounter_params
      params.require(:encounter).permit(:details, :party_size, :cr, :climate, :terrain, :seed)
    end

  # Returns the appropriate experience reward for a given challenge rating
  private
    def experience_award(challenge_rating)
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
        return experience[challenge_rating]
    end
    
  # Adjusts average party level based on party size, per Pathfinder's suggestion
  private
    def adjust_party_level(party_level, party_size)
        if party_size > 6
            party_level += 1
        elsif party_size < 4
            party_level -= 1
        end
        return party_level
    end
    
    # Currently displays all characters
    def index
    end
    
end

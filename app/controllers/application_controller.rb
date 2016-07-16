# Controller for Application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
   
  # Validates all necessary parameters for Adventures
  protected
    def adventure_params
      params.require(:adventure).permit(:title, :plot, :party_size, :cr)
    end
   
  # Validates all necessary parameters for Encounters
  protected
    def encounter_params
      params.require(:encounter).permit(:details, :party_size, :cr, :climate, :terrain)
    end
    
  # Validates all necessary parameters for Maps
  protected
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end

  # Returns the appropriate experience reward for a given challenge rating
  protected
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
  protected
    def adjust_party_level(party_level, party_size)
        if party_size > 6
            party_level += 1
        elsif party_size < 4
            party_level -= 1
        end
        return party_level
    end
    
    
end

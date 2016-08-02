# Adventure Model
# Composed of a map filled with encounters
class Adventure < ActiveRecord::Base
    has_one :map
    has_many :encounters
    
    # Generates a series of appropriate Encounters, culminating with a Boss Encounter
    #
    # ==== Attributes
    # * +adventure_params+ - parameters required for encounter generation
    #
    # Returns an array of Encounters for the Adventure
    def self.calculateEncounters(adventure_params)
        encounters = Array.new
        num_encounters = 4 + rand(5)
        cr = adventure_params[:cr].to_i
        difficulty_modifier = [-1, -1, 0, 0, 0]
        num_encounters.times do |i|
            if(cr > 0)
                adventure_params[:cr] = cr + difficulty_modifier.sample
            end
            encounters << generateEncounter(adventure_params)
        end
        
        #Add a boss fight
        if cr < 25
            adventure_params[:cr] = cr + 1
        end
        adventure_params[:details] = "BOSS"
        encounters << generateEncounter(adventure_params)
        
        return encounters
    end
    
    # Generates a single Encounter
    #
    # ==== Attributes
    # * +enc_params+ - parameters required for encounter generation
    #
    # Returns a single Encounter for the Adventure
    def self.generateEncounter(enc_params)
        encounter = Encounter.new(enc_params)
        xp = Encounter.calculateExperienceReward(enc_params[:cr], enc_params[:party_size])
        encounter.xp = xp
        encounter.characters =  Encounter.calculateCharacters(  xp, 
                                                                enc_params[:climate], 
                                                                enc_params[:terrain])
        return encounter
    end
    
end

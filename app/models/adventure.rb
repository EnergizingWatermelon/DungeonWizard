# Adventure Model
# Composed of a map filled with encounters
class Adventure < ActiveRecord::Base
    has_one :map
    has_many :encounters
    
    def self.calculateEncounters(adventure_params)
        encounters = Array.new
        num_encounters = 4 + rand(5)
        cr = adventure_params[:cr].to_i
        difficulty_modifier = [-1, -1, 0, 0, 0]
        num_encounters.times do |i|
            adventure_params[:cr] = cr + difficulty_modifier.sample
            encounters << generateEncounter(adventure_params)
        end
        
        #Add a boss fight
        adventure_params[:cr] = cr + 1
        adventure_params[:details] = "BOSS"
        encounters << generateEncounter(adventure_params)
        
        return encounters
    end
    
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

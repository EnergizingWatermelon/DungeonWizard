# Adventure Model
# Composed of a map filled with encounters
class Adventure < ActiveRecord::Base
    has_one :map
    has_many :encounters
    
    #Generate a random number of encounters
    def self.calculateEncounters(enc_params)
        num_encounters = 5 + rand(5)
        encounters = Array.new(num_encounters)
        #encounters.each do |encounter|
        num_encounters.times do |i|
            encounter = Encounter.new(enc_params)
            encounter.xp = Encounter.calculateExperienceReward(enc_params[:cr], enc_params[:party_size])
            encounter.characters = Encounter.calculateCharacters(encounter.xp, encounter.climate, encounter.terrain)
            encounters[i] = encounter
        end
        return encounters
    end
end

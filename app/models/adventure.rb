# Adventure Model
# Composed of a map filled with encounters
class Adventure < ActiveRecord::Base
    has_one :map
    has_many :encounters
    
    #Generate a random number of encounters
    def self.calculateEncounters(adventure, enc_params)
        num_encounters = 5 + rand(5)
        #adventure.encounters = Array.new(num_encounters)
        #encounters.each do |encounter|
         enc_params[:xp] = Encounter.calculateExperienceReward(enc_params[:cr], enc_params[:party_size])
        num_encounters.times do |i|
            adventure.encounters << Encounter.new(enc_params)
            #encounter.xp = Encounter.calculateExperienceReward(enc_params[:cr], enc_params[:party_size])
            adventure.encounters[i].characters = Encounter.calculateCharacters(enc_params[:xp], enc_params[:climate], enc_params[:terrain])
        end
    end
end

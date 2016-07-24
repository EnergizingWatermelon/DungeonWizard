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
        @encounter.xp = Encounter.calculateExperienceReward(@encounter.cr, @encounter.party_size)
        #TODO: Add additional encounter types
        @encounter.characters = Encounter.calculateCharacters(@encounter.xp, @encounter.climate, @encounter.terrain)
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

    # Displays encounter generation form
    def index
    end
    
end

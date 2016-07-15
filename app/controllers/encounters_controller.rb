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
        total = @encounter.cr * @encounter.party_size
        xp = 0
        
        #Gather a collection of characters that can spawn in this area and whose CR will not exceed the total value
        while xp < total
            characters = Character.where("cr <= ?", total - xp).where("climate == ?", @encounter.climate).where("terrain == ?", @encounter.terrain)
            character = characters.sample
            xp += character.cr
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

    # Currently displays all characters
    def index
    end
    
end

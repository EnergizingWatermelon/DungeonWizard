# Controller class for Encounters
class EncountersController < ApplicationController
    
    # Currently displays all characters
    def index
            @characters = Character.all
    end
    
end

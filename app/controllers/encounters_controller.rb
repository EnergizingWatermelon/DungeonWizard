class EncountersController < ApplicationController
    
    def index
            @characters = Character.all
    end
    
end

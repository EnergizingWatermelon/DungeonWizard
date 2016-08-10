require 'MapGenerator'

# Controller class for Adventures
class AdventuresController < ApplicationController
    
    # Displays adventure creation form
    def index
    end
    
    # Creates a new Adventure
    def new
        @adventure = Adventure.new
    end
  
    # Checks receives parameters and attempts to create a new Adventure and Map. 
    # If the adventure or map fail to save to the database for whatever reason, the user is redirected to the index.
    def create
        @adventure = Adventure.new(adventure_params)
        if (@adventure.save)
            @adventure.map = Map.new(map_params)
            @adventure.encounters = Adventure.calculateEncounters(adv_encounter_params)
            if(@adventure.save)
                redirect_to @adventure
            else
                redirect_to '/adventures'
            end
        else
            redirect_to '/adventures'
        end
    end
    
    # Displays the Adventure specified in the id parameter
    def show
        @adventure = Adventure.find(params[:id])
        @grid = MapGenerator.generateMap(@adventure.map.seed, @adventure.map.terrain)
        @terrain_tile = Map.get_tile_name(@adventure.map.terrain)
        @unplayable_tile = Map.get_unplayable_name(@adventure.map.climate)
    end
    
    private
    def adv_encounter_params
        adv_parms = params[:adventure]
        map_parms = params[:map]
        enc_params = Hash.new
        enc_params[:party_size] = adv_parms[:party_size]
        enc_params[:cr] = adv_parms[:cr]
        enc_params[:climate] = map_parms[:climate]
        enc_params[:terrain] = map_parms[:terrain]
        return enc_params
    end
    
end
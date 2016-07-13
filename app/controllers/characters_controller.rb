# Controller for Characters
class CharactersController < ActionController::API
    
    # Uses typeahead to search for viable terrain-climate combinations
    def index
        #params['climate'] is the value entered for Climate, or nil
        #params['terrain'] is the value entered for Terrain, or nil
        #params['target'] is the field in user focus
        if params['target'] == 'climate'
            if params['terrain']
                array = Character.where(terrain: params['terrain']).select('climate').distinct
            else
                array = Character.select(:climate).distinct
            end
        elsif params['target'] == 'terrain'
            if params['climate']
                array = Character.where(climate: params['climate']).select('terrain').distinct
            else
                array = Character.select(:terrain).distinct
            end
        end
        render :json => array
    end
    
end

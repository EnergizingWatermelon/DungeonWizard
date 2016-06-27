# Controller for Characters
class CharactersController < ActionController::API
    
    def index
        #params['climate'] is the value entered for Climate, or nil
        #params['terrain'] is the value entered for Terrain, or nil
        #params['target'] is the field in user focus
        if params['target'] == 'climate'
            if params['terrain']
                array = Character.where(name: params['terrain'])
            else
                array = Character.all
            end
        elsif params['target'] == 'terrain'
            if params['climate']
                array = Character.where(name: params['climate'])
            else
                array = Character.all
            end
        end
        render :json => array
    end
    
end

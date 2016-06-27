# Controller for Characters
class CharactersController < ActionController::API
    
    def index
        #params[:climate] is the value entered for Climate, or nil
        #params[:terrain] is the value entered for Terrain, or nil
        #params[:target] is the field in user focus
        @array = Character.all()
        render :json => @array
    end
    
end

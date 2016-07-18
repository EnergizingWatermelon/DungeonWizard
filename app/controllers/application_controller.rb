# Controller for Application
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   
   
  # Validates all necessary parameters for Adventures
  protected
    def adventure_params
      params.require(:adventure).permit(:title, :plot, :party_size, :cr)
    end
   
  # Validates all necessary parameters for Encounters
  protected
    def encounter_params
      params.require(:encounter).permit(:details, :party_size, :cr, :climate, :terrain)
    end
    
  # Validates all necessary parameters for Maps
  protected
    def map_params
      #Merge a new random seed into the initial params
      params.require(:map).permit(:name, :seed, :climate, :terrain)
                          .merge({:seed => Random.new_seed % 2147483647})
    end

end

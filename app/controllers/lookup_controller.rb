class LookupController < ApplicationController
    
    def index
        params[:Climate] ||= 'Temperate'
        params[:Terrain] ||= 'Forest'
    end
    
end
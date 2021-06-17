class ShowdownsController < ApplicationController

    def show
      @showdown= Showdown.find(params[:id])
      @session= @showdown.session
      
    end
end

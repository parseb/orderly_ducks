class ShowdownsController < ApplicationController
  before_action :authenticate_user!, :present



    def show
      
      @session= @showdown.session
      @moderator= User.find @session.moderator
      @invited= @session.users
      @c=session[:color]
      @presence= @showdown.presence.uniq
      @sid=params[:id] 
      ##@refact Authorization channel hopping
     
      
    end

    def joins
      @showdown.presence.append([current_user.name, current_user.id])
      @showdown.presence.uniq! 
      @showdown.save!
      redirect_to showdown_path(@showdown)
      
    end



    def present
      @showdown= Showdown.find(params[:id])
      
      
    end

  private

  def authenticate_user!
      if user_signed_in?
      #thisspacecouldbeuseful
      else
          redirect_to new_user_session_path, 
          notice: "Found the Log In form for you." 
      end
  end
end

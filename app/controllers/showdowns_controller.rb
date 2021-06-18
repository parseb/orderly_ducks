class ShowdownsController < ApplicationController
  before_action :authenticate_user!, :ensure_invited, :secure_presence


    def show
      
      pids= @showdown.presence
      @presence= User.where(id:pids).map {|user| user.name }
      @session= @showdown.session
      @moderator= User.find @session.moderator
      @invited= @session.users
      
      @c=session[:color]

    end

    def joins
      @showdown= Showdown.find(params[:id])
      #@showdonw.presence.append(current_user)
      @showdonw.save!
      
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
    
    def secure_presence
      @showdown= Showdown.find(params[:id])
      @cid= current_user.id
      @showdown.presence.include?(@cid) ? true : @showdown.presence << @cid
      @showdown.save!  
    end

    def ensure_invited

    end

end

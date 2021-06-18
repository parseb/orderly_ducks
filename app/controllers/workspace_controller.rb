class WorkspaceController < ApplicationController
    before_action :authenticate_user!
    

    def start
        @session= Session.new  
        @u= current_user.id
        @sessions= current_user.sessions.order(:s_time).reverse
       
    end

    def joins
        @join_showdown= Showdown.find(params[:id])
        redirect_to showdown_path(@join_showdown)
    end


    def addusertosessionfrominvite
        #params[:auth]
        #find sessin where auth == 
        #if current_user.id not in session.users -> add user -> redirect 
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
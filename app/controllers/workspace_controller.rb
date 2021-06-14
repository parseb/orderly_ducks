class WorkspaceController < ApplicationController
    before_action :authenticate_user!
    before_action :session_params, only: :create_session

    def start
        @session= Session.new  
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
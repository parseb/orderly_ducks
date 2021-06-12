class WorkspaceController < ApplicationController
    before_action :authenticate_user!
    
    def start
    
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

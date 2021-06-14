class SessionsController < ApplicationController
    before_action :session_params, only: [:create, :edit, :destroy]

    def new
        #in workspace
    end

    def create
        @session= Session.create(session_params)
        uid=current_user.id
        @session.user_id=uid
        @session.save!
        redirect_to workspace_path(uid)
    end

    def edit
    end

    def destroy
    end


    private
    
    def session_params
        params.require(:session).permit(:title,:s_time,:e_time,:agenda,:transcript,:state,:aceess_code,:user_id)
    end

end

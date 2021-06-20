class SessionsController < ApplicationController
    before_action :session_params, only: [:create, :edit, :destroy]
    before_action :authenticate_user!

    def new
        #in workspace
    end

    def create
        @session= Session.create(session_params)
        uid=current_user.id
        @session.created_by =uid #s
        @session.moderator =uid #default
        @session.users << current_user
        @session.save!
        flash[:success] =  "Done!"
        redirect_to workspace_path(uid)
    end

    def edit
    end

    def show
        @session= Session.find(params[:id])
        @invited= @session.users
    end


    def destroy
    end

    def addsession
        @session = Session.where(accesscode: params[:invited][:invited]).first
        check ||= @session.users.include? current_user 
        if check 
            redirect_to workspace_path(current_user.id)
            flash[:alert]= 'Nothing to do. You already have access to this session.'
        elsif @session
            @session.users << current_user
            @session.save!
            redirect_to workspace_path(current_user.id)
            flash[:success] = "Session retrieved. Good job Everyone!"
        else
            redirect_to workspace_path(current_user.id)
            flash[:alert] = "Session Not found"
        end
    end

    private
    
    def session_params
        params.require(:session).permit(:title,:s_time,:e_time,:agenda,:transcript,:state,:aceess_code,:user_id)
    end

    def authenticate_user!
        if user_signed_in?
        #thisspacecouldbeuseful
        else
            redirect_to new_user_session_path, 
            notice: "Found the Log In form for you." 
        end
    end
end

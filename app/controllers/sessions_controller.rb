class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :facebook]
    
    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Login failed, email/password can't be blank."
            redirect_to login_path
        end
    end


    #Need to add def facebook: omniauth login method

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end

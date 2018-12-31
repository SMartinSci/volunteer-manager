class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create, :facebook]
    
    def new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:notice] = "Login failed, email/password can't be blank."
            redirect_to login_path
        end
    end

    def facebook
        if auth = request.env["omniauth.auth"]
            @user = User.find_or_create_by_omniauth(auth)
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end

class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def index
    end
    
    def new
        @user = User.new
    end
    
    def show
        @user = User.find(params[:id]) 
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:msg] = "Successfully Signed Up!"
            redirect_to projects_path
        else
            render :new
        end
    end
      
    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end 
end

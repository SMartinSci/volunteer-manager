class RolesController < ApplicationController
    
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :set_role, only: [:show, :edit, :update, :destroy]

    def index
        @roles = Role.all
    end

    def show
    end

    def new
        @role = Role.new
    end

    def create
        @user = User.find(params[:role][:user_id])
        @role = @user.roles.new(role_params)
        if @role.save
            flash[:msg] = "Role created!"
            redirect_to role_path(@role.id)
        else
            render :new
        end
    end

    def edit
        @role = Role.find(params[:id])
    end

    def update
        @role = current_user.roles.find(params[:id])
        if @role.update(role_params)
        flash[:msg] = "Role updated."
            redirect_to role_path(@role)
        else
            render :edit
        end
    end

    def destroy
        @role = current_user.roles.find(params[:id])
            @role.destroy
            flash[:msg] = "Role deleted!"
            redirect_to roles_path
    end

    private

    def set_role
        @role = Role.find(params[:id])
    end

    def roles_params
        params.require(:role).permit(:user_id, :project_id, :name)
    end
end
class RolesController < ApplicationController
    
    def index
        @roles = Role.all
    end

    def show
    end

    def new
        @role = Role.new
    end

    def create
        @role = Role.create(role_params)
        if @role.save
            redirect_to role_path(@role)
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
        flash[:message] = "Role updated."
            redirect_to role_path(@role)
        else
            render :edit
        end
    end

    def destroy
        @role = current_user.roles.find(params[:id])
            @role.destroy
            flash[:message] = "Role deleted!"
            redirect_to roles_path
        end
    end

    private

    def set_role
        @role = Role.find(params[:id])
    end

    def roles_params
        params.require(:role).permit(:user_id, :project_id, :name)
    end
end
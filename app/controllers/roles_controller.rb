class RolesController < ApplicationController
    
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :set_role, only: [:show, :index, :update, :destroy]

    def index
            @project = Project.find_by(id: params[:project_id])
            @roles = Role.all
    end

    def show

    end

    def new
        @role = Role.new
    end

    def create
        @project = Project.find(params[:role][:project_id])
        @role = @project.roles.build(role_params)
        if @role.save
            flash[:msg] = "Role created!"
            redirect_to role_path(@role)
        else
            render :new
        end
    end

    def update
        @role = Role.find(params[:id])
        if @role.update(role_params)
        flash[:msg] = "Role updated."
            redirect_to role_path(@role)
        else
            render :edit
        end
    end

    def destroy
        @role.destroy
        flash[:msg] = "Role deleted!"
        redirect_to roles_path
    end

    private

    def set_role
        @role = Role.find_by(id: params[:id]) 
    end

    def role_params
        params.require(:role).permit(:user_id, :project_id, :name)
    end
end
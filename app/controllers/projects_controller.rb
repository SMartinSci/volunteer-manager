class ProjectsController < ApplicationController
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :set_project, only: [:show, :create, :new, :edit, :update, :destroy]
    
    def index 
        @projects = Project.all
        # Project.find(params[:id]) 
        # @roles = @project.roles
    end 

    def this_year
        @projects = Project.this_year
    end


    def next_project
        @project = Project.next_project
    end

    def show  
        @project = Project.find(params[:id])
        @role = Role.find_by(id: params[:id])
        @user = User.find_by(id: params[:id])
    end 

    def new
        @project = Project.new
       # @project.user_id = params[:user_id]
    end 

    def create 
        @project = current_user.created_projects.build(project_params) 
        if @project.save
            flash[:msg] = "Project created!"
            redirect_to project_path(@project)
        else
            render :new 
        end
    end 

    def edit  
    end

    def update
        @project = current_user.created_projects.find(params[:id]) 
        if 
            @project.update(project_params)
            flash[:msg] = "Project successfully updated!"
            redirect_to project_path(@project)
        else
            render :edit
        end
    end
    
    def destroy
        @project.destroy
        flash[:msg] = "Project deleted!"
        redirect_to projects_path
    end 

    private

    def set_project
        @project = Project.find_by(id: params[:id]) 
    end 
    
    def project_params
        params.require(:project).permit(:name, :user_id, :location, :description, :date, :time)
    end
end

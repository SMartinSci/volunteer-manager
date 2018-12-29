class ProjectsController < ApplicationController
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
    def index 
        @projects = Project.all 
    end 

    def show  
    end 

    def new
        @project = Project.new
    end 

    def create 
        @user = User.find(params[:user_id])
        @project = @user.projects.build(project_params)
        if @project.save
            flash[:message] = "Project created!"
            redirect_to project_path(@project)
        else
            render :new 
        end
    end 

    def edit  
    end

    def update
        if @project.update(project_params)
            flash[:message] = "Project successfully updated!"
            redirect_to project_path(@project)
        else
            render :edit
    end
    
    def destroy
        @project = current_user.projects.find(params[:id])
        @project.destroy
        flash[:message] = "Project deleted!"
        redirect_to projects_path
    end 

    private

    def set_project
        @project = Project.find_by(id: params[:id]) 
    end 
    
    def project_params
        params.require(:project).permit(:name, :location, :description, :date, :time)
    end
end

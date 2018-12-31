class ProjectsController < ApplicationController
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    
    def index 
        @projects = Project.all 
    end 

    def this_year
        @projects = Project.this_year
    end

    def show  
        @project = Project.find(params[:id])
    end 

    def new
        @project = Project.new
    end 

    def create 
        @project = Project.new(project_params)
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
        if @project.update(project_params)
            flash[:msg] = "Project successfully updated!"
            redirect_to project_path(@project)
        else
            render :edit
    end
    
    def destroy
        @project = current_user.projects.find(params[:id])
        @project.destroy
        flash[:msg] = "Project deleted!"
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

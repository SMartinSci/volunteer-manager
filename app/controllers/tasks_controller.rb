class TasksController < ApplicationController
    before_action :logged_in?, only: [:index, :update, :destroy]
    before_action :set_task, only: [:show, :index, :update, :destroy]


    def index
      if params[:role_id]
        @tasks = Role.find(params[:role_id]).tasks
      else
        @tasks = Task.all
      end
    end
    
    def show    
      @task = Task.find(params[:id])
    end

    def new
      @task = Task.new
    end
    
    def create
      @role = Role.find(params[:task][:role_id])
      @task = @role.tasks.build(task_params)
      if @task.save
        flash[:msg] = "Task created!"
        redirect_to task_path(@task)
      else
        render :new
      end
    end

    def update
      @task = Task.find(params[:id])
      if @task.update(task_params)
       flash[:msg] = "Task updated."
          redirect_to task_path(@task)
      else
        render :edit
      end
    end

    def destroy
      @task.destroy
      flash[:msg] = "Task deleted!"
      redirect_to tasks_path
    end

    private
  
    def set_task
      @task = Task.find_by(id: params[:id])
    end
  
    def task_params
      params.require(:task).permit(:role_id, :description)
    end
end

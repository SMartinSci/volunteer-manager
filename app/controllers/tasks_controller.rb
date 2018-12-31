class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]

    def index
      @tasks = Task.all
    end
  
    def new
      @task = Task.new
    end
  
    def show
      if current_user
        @role = current_user.roles.build(task: @task)
      end
    end
  
    def create
      @role = Role.find(params[:task][:role_id])  
      @task = @role.tasks.new(task_params)
      if @task.save
        flash[:msg] = "Task created!"
        redirect_to task_path(@task.id)
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @task.update(task_params)
      if @task.save
        flash[:msg] = "Task updated!"
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
      @task = Task.find_by_id(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:role_id, :description)
    end
end

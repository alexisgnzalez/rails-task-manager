class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    # pry-byebug
    @task = Task.find(params[:id])
    @task.update(task_params)
    if params[:completed] == 1
      @task.completed = true
      @task.update
    end
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @taks.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

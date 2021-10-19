class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
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
    # @task = Task.find(params[:id])
  end

  def update
    # pry-byebug
    # @task = Task.find(params[:id])
    @task.update(task_params)
    if params[:completed] == 1
      @task.completed = true
      @task.update
    end
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.delete
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

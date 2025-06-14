class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task), notice: "Tâche créée avec succès !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "Tâche mise à jour avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path, notice: "Tâche supprimée avec succès !", status: :see_other
  end
end

private

def task_params
  params.require(:task).permit(:title, :details, :completed)
end

def set_task
  @task = Task.find(params[:id])
end

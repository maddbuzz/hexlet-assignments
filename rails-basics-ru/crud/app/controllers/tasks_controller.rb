# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.order(created_at: :desc)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      # Flash сообщение
      # Сообщение рендерится в базовом шаблоне app/views/layouts/application.html.erb
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'New task was successfully created'
      # Выполняется новый полноценный запрос

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be created'
      # Отрисовывается форма создания, все параметры остаются
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'Task was successfully updated'
      # Выполняется новый полноценный запрос

      redirect_to task_path(@task)
    else
      flash[:failure] = 'Task cannot be updated'
      # Отрисовывается форма создания, все параметры остаются
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      # Flash сообщение
      # https://api.rubyonrails.org/classes/ActionDispatch/Flash.html
      flash[:success] = 'task was successfully deleted'
      # Выполняется новый полноценный запрос

      redirect_to tasks_path, status: :see_other
    else
      flash[:failure] = 'Task cannot be deleted'
      # Отрисовывается форма создания, все параметры остаются
      redirect_to task_path(@task)
    end
  end

  private

  def task_params
    # Требуем наличия ключа :task в params. Разрешаем использовать только некоторые ключи
    params.required(:task).permit(:name, :status, :creator, :performer, :completed, :description)
  end
end

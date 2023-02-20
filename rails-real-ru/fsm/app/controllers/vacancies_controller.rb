# frozen_string_literal: true

class VacanciesController < ApplicationController
  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
    @archived = Vacancy.archived
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def publish
    @vacancy = Vacancy.find params[:id]
    if @vacancy.may_publish?
      @vacancy.publish!
      redirect_to vacancies_path, notice: 'Vacancy was successfully published.'
    else
      redirect_to vacancies_path, alert: 'Vacancy cannot be published!'
    end
  end

  def archive
    @vacancy = Vacancy.find params[:id]
    if @vacancy.may_archive?
      @vacancy.archive!
      redirect_to vacancies_path, notice: 'Vacancy was successfully archived.'
    else
      redirect_to vacancies_path, alert: 'Vacancy cannot be archived!'
    end
  end
  # END

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end
end

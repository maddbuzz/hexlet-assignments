# frozen_string_literal: true

class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end

  def show
    @status = Status.find params[:id]
  end

  def new
    @status = Status.new
  end

  def edit
    @status = Status.find params[:id]
  end

  def create
    @status = Status.new(status_params)

    if @status.save
      redirect_to @status, notice: 'Status was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @status = Status.find params[:id]

    if @status.update(status_params)
      redirect_to @status, notice: 'Status was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @status = Status.find params[:id]

    @status.destroy

    redirect_to statuses_url, notice: 'Status was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def status_params
    params.require(:status).permit(:name)
  end
end

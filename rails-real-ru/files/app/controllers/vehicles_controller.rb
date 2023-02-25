# frozen_string_literal: true

class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all
  end

  def show
    @vehicle = Vehicle.find params[:id]
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find params[:id]
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to @vehicle, notice: 'Vehicle was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @vehicle = Vehicle.find params[:id]

    if @vehicle.update(vehicle_params)
      redirect_to @vehicle, notice: 'Vehicle was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @vehicle = Vehicle.find params[:id]

    @vehicle.destroy

    redirect_to vehicles_url, notice: 'Vehicle was successfully destroyed.'
  end

  private

  # Only allow a list of trusted parameters through.
  def vehicle_params
    params.require(:vehicle).permit(
      :manufacture,
      :model,
      :color,
      :doors,
      :kilometrage,
      :production_year,
      :image
    )
  end
end

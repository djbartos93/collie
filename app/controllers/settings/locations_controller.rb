class Settings::LocationsController < ApplicationController
  before_action :set_location, only: [:destroy]

  def create
    @location = Location.new(location_params)
    authorize! :create, @location

    respond_to do |format|
      if @location.save
        format.html { redirect_to settings_root_path, notice: 'location was successfully created.' }
        format.json { render json: @location, status: :created }
      else
        format.html { redirect_to settings_root_path, notice: 'Location was not created.' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :delete, @location

    @location.destroy
    respond_to do |format|
      format.html { redirect_to settings_root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name)
  end
end

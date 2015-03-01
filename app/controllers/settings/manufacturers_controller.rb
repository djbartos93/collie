class Settings::ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:destroy]

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    authorize! :create, @manufacturer

    respond_to do |format|
      if @manufacturer.save
        format.html { redirect_to settings_root_path, notice: 'Manufacturer was successfully created.' }
        format.json { render json: @manufacturer, status: :created }
      else
        format.html { redirect_to settings_root_path, notice: 'Manufacturer was not created.' }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :delete, @manufacturer

    @manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to settings_root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_manufacturer
    @manufacturer = Manufacturer.find(params[:id])
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end

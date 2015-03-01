class Settings::TypesController < ApplicationController
  before_action :set_type, only: [:destroy]

  def create
    @type = Type.new(type_params)
    authorize! :create, @type

    respond_to do |format|
      if @type.save
        format.html { redirect_to settings_root_path, notice: 'Type was successfully created.' }
        format.json { render json: @type, status: :created }
      else
        format.html { redirect_to settings_root_path, notice: 'Type was not created.' }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :delete, @type

    @type.destroy
    respond_to do |format|
      format.html { redirect_to settings_root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_type
    @type = Type.find(params[:id])
  end

  def type_params
    params.require(:type).permit(:name)
  end
end

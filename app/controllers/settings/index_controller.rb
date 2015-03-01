class Settings::IndexController < ApplicationController
  before_action :set_new_settings, :set_settings, only: [:index]

  def index
    authorize! :index, :settings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  private

  def set_settings
    @types = Type.all
    @manufacturers = Manufacturer.all
    @states = State.all
  end

  def set_new_settings
    @new_type = Type.new
    @new_state = State.new
    @new_manufacturer = Manufacturer.new
  end
end

class Settings::IndexController < ApplicationController
  before_action :set_new_settings, :set_settings, only: [:index]

  def index
    authorize! :index, :settings

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  private

  def set_settings
    @types = Type.order name: :asc
    @manufacturers = Manufacturer.order name: :asc
    @states = State.order name: :asc
  end

  def set_new_settings
    @new_type = Type.new
    @new_state = State.new
    @new_manufacturer = Manufacturer.new
  end
end

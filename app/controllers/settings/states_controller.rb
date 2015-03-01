class Settings::StatesController < ApplicationController
  before_action :set_state, only: [:destroy]

  def create
    @state = State.new(state_params)
    authorize! :create, @state

    respond_to do |format|
      if @state.save
        format.html { redirect_to settings_root_path, notice: 'State was successfully created.' }
        format.json { render json: @state, status: :created }
      else
        format.html { redirect_to settings_root_path, notice: 'State was not created.' }
        format.json { render json: @state.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :delete, @state

    @state.destroy
    respond_to do |format|
      format.html { redirect_to settings_root_path }
      format.json { head :no_content }
    end
  end

  private

  def set_state
    @state = State.find(params[:id])
  end

  def state_params
    params.require(:state).permit(:name)
  end
end

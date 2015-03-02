class Settings::UpdatesController < ApplicationController

  def rentable_asset_type
    update_setting Settings::RentableAssetType
  end

  private

  def update_setting(klass)
    setting = klass.get
    setting.update_attributes(setting_params)
    redirect_to settings_root_path
  end

  def setting_params
    params.require(:setting).permit!
  end
end

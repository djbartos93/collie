class AddTypeparamsToAssets < ActiveRecord::Migration
  def change
    add_reference :assets, :type, index: true
  end
end

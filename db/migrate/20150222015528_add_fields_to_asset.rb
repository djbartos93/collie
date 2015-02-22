class AddFieldsToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :description, :text
    add_column :assets, :location, :string
    add_column :assets, :model_number, :string
    add_reference :assets, :manufacturer, index: true
  end
end

class ChangeManufacturerColumnName < ActiveRecord::Migration
  def change
    rename_column :manufacturers, :manufacturer_name, :name
  end
end

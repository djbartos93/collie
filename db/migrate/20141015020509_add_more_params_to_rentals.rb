class AddMoreParamsToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :equipment_needed, :text
  end
end

class RemoveIdFromAssetsRentals < ActiveRecord::Migration
  def change
    remove_column :assets_rentals, :id
  end
end

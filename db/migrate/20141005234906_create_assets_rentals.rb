class CreateAssetsRentals < ActiveRecord::Migration
  def change
    create_table :assets_rentals do |t|
      t.references :asset, index: true
      t.references :rental, index: true

      t.timestamps
    end
  end
end

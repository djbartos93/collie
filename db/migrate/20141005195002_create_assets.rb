class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_name
      t.string :serial_number
      t.date :purchase_date
      t.float :cost
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end

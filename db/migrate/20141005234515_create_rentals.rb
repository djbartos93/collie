class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :user, index: true
      t.datetime :checkout_time
      t.datetime :checkin_time

      t.timestamps
    end
  end
end

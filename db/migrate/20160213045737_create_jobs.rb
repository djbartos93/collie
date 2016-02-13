class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :progect
      t.string :box_number
      t.string :wire_number
      t.integer :start_foot
      t.integer :end_foot
      t.integer :pulled_length
      t.boolean :jack_lock
      t.string :item_id
      t.integer :qty_used

      t.timestamps null: false
    end
  end
end

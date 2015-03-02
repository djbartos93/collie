class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :type, null: false
      t.string :string_value
      t.integer :int_value
      t.date :date_value
    end

    add_index :settings, :type, unique: true
  end
end

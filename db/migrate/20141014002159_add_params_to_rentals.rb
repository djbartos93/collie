class AddParamsToRentals < ActiveRecord::Migration
  def change
    add_column :rentals, :event_title, :string
    add_column :rentals, :event_location, :string
    add_column :rentals, :event_description, :string
    add_column :rentals, :event_date, :date
    add_column :rentals, :setup_help, :boolean
  end
end

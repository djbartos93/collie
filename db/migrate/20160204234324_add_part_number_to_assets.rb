class AddPartNumberToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :part_number, :string
  end
end

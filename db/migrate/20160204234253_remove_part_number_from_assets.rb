class RemovePartNumberFromAssets < ActiveRecord::Migration
  def change
    remove_column :assets, :partnumber, :string
  end
end

class DeleteModel < ActiveRecord::Migration
  def change
    drop_table :models
  end
end

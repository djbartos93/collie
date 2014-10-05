class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :model_name
      t.string :model_number

      t.timestamps
    end
  end
end

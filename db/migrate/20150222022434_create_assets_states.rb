class CreateAssetsStates < ActiveRecord::Migration
  def change
    create_table :assets_states, :id => false do |t|
      t.references :asset, index: true
      t.references :state, index: true

      t.timestamps
    end
  end
end

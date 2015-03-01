class MakeStatesHasMany < ActiveRecord::Migration
  def change
    drop_table :assets_states
    add_reference :assets, :state, index: true
  end
end

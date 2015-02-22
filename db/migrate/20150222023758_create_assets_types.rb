class CreateAssetsTypes < ActiveRecord::Migration
  def change
    create_table :assets_types, :id => false do |t|
      t.references :asset, index: true
      t.references :type, index: true

      t.timestamps
    end
  end
end

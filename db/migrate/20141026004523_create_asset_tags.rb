class CreateAssetTags < ActiveRecord::Migration
  def change
    create_table :asset_tags do |t|
      t.string :tag_number
      t.references :asset, index: true

      t.timestamps
    end
  end
end

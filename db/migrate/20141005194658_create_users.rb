class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :org
      t.string :password_digest
      t.string :external_id
      t.boolean :active

      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :account_number
      t.boolean :complete
      t.integer :job_id
      t.text :notes

      t.timestamps null: false
    end
  end
end

class RemoveNameFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :job_name, :string
  end
end

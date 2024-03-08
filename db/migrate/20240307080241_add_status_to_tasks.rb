class AddStatusToTasks < ActiveRecord::Migration[7.1]
  def change
    change_table :tasks do |t|
      t.integer :status
    end
  end
end

class ChangeDatetypestartDateObTasks < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :start_date, :date
  end
end

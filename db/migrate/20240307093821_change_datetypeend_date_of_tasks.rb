class ChangeDatetypeendDateOfTasks < ActiveRecord::Migration[7.1]
  def change
    change_column :tasks, :end_date, :date
  end
end

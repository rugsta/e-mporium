class ChangeTableNameTasks < ActiveRecord::Migration
  def change
    rename_table :tasks, :products
  end
end

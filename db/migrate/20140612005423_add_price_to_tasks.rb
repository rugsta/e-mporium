class AddPriceToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :price, :decimal, :precision => 8, :scale =>2
  end
end

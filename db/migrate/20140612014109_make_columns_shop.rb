class MakeColumnsShop < ActiveRecord::Migration
  def change
    rename_column :tasks, :title, :product_name
    rename_column :tasks, :completed, :archived
  end
end

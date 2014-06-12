class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :product_name
      t.integer :category_id
      t.string :note
      t.boolean :archived

      t.timestamps
    end
  end
end

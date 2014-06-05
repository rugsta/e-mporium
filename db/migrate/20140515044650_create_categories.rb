class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end

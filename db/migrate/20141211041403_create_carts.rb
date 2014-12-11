class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :user_id
      t.boolean :checked_out, default: false

      t.timestamps
    end
  end
end

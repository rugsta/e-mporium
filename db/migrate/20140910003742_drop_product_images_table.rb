class DropProductImagesTable < ActiveRecord::Migration
  def change
    drop_table :product_images
  end
end

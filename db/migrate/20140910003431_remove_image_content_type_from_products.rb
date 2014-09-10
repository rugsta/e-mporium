class RemoveImageContentTypeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image1_content_type, :string
  end
end

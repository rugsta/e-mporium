class RemoveSingleImageUploadFromProductsTable < ActiveRecord::Migration
  def change
    remove_column :products, :image1_file_name, :string
    remove_column :products, :image1_file_size, :integer
    remove_column :products, :image1_updated_at, :datetime
  end
end


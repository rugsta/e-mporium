class AddPaperclipToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :image_default, :boolean
    add_column :assets, :image_name, :string
    add_column :assets, :image_content_type, :string
    add_column :assets, :image_file_size, :integer
  end
end

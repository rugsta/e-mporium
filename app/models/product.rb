class Product < ActiveRecord::Base

  validates_presence_of  :category_id, :note, :product_name, :price

  #so when a model/table has an id that's referencing another model/table then use belongs_to
  belongs_to :category

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images

end

class Category < ActiveRecord::Base
  validates_presence_of :category_name

  #category has no reference to a product and hence uses has_many
  has_many :products
end

class Task < ActiveRecord::Base
  validates_presence_of  :category_id, :category_name, :note, :product_name, :price
  #validates :product_name, :note, presence: true

  #so when a model/table has an id that's referencing another model/table then use belongs_to
  belongs_to :category
end

class Cart < ActiveRecord::Base
  validates_presence_of :user_id

  #cart_line_items has no reference to a product and hence uses has_many
  has_many :cart_line_items

end

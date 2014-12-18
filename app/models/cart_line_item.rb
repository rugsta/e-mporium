class CartLineItem < ActiveRecord::Base
  validates_presence_of :cart_id, :product_id

  belongs_to :cart
end

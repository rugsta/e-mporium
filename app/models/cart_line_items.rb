class CartLineItems < ActiveRecord::Base
  validates_presence_of :card_id, :product_id, :product_price

  belongs_to :cart
end

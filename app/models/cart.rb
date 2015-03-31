class Cart < ActiveRecord::Base
  validates_presence_of :user_id

  #cart_line_items has no reference to a product and hence uses has_many
  has_many :cart_line_items
  has_one :order

  def price_in_cents
    ((self.cart_line_items.collect { |cli| cli.product.price }.sum)*100).to_i
  end


  def express_token=(token)
    puts "yeeoo"
    write_attribute(:express_tokenID, token)
    if new_record? && !token.blank?
      details = EXPRESS_GATEWAY.details_for(token)
      self.express_payerID = details.payer_id
      self.first_name = details.params["first_name"]
      self.last_name = details.params["last_name"]
    end
  end

end

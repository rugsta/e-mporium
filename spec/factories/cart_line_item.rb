
FactoryGirl.define do

  factory :cart_line_item do |line_item|
    line_item.cart_id 1
    line_item.product_id 1
  end

end

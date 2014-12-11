# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cart_line_item, :class => 'CartLineItems' do
    cart_id 1
    product_id 1
    product_price "9.99"
  end
end

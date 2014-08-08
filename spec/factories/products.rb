
FactoryGirl.define do
  factory :product do |product|
    product.product_name "Factory Girl Created Product"
    product.category_id "1"
    product.note "This is a note from Factory Girl"
    product.price "19.99"
  end
end
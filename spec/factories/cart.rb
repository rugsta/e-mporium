FactoryGirl.define do

  factory :cart do
    checked_out false
    user_id "userID"

    factory :cart_with_line_item do
      after(:create) do |cart|
        create_list(:cart_line_item, 1, cart: cart)
      end
    end

    factory :cart_with_line_item_and_product do
      after(:create) do |cart|
        create_list(:cart_line_item, 1, cart: cart)
        create_list(:product, 1, :with_category_id)

      end
    end



  end
end


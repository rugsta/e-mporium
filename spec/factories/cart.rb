FactoryGirl.define do

  factory :cart do
    checked_out false

    factory :cart_with_line_item do
      after(:create) do |cart|
        create_list(:cart_line_item, 1, cart: cart)
      end
    end

  end
end


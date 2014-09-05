FactoryGirl.define do

  factory :category do
    category_name "FG Active Category"
    active true

    factory :category_with_products do
      after(:create) do |category|
        create_list(:product, 1, category: category)
      end
    end

  end

    trait :inactive do
      category_name "FG Inactive Category"
      active false
    end


end
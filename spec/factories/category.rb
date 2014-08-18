FactoryGirl.define do

  factory :category do |category|
    category.category_name "FG Default Category"
    category.active true
  end

  factory :invalid_category, parent: :category do |category|
    category.category_name nil
  end

  factory :category_active, parent: :category do |category|
    category.category_name "FG Active Category "
    category.active true
  end

  factory :category_inactive, parent: :category do |category|
    category.category_name "FG Inactive Category"
    category.active false
  end
end
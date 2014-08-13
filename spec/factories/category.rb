FactoryGirl.define do

  factory :category do |category|
    category.category_name "Factory Girl Category Default"
    category.active true
  end

  factory :invalid_category, parent: :category do |category|
    category.category_name nil
  end

  factory :category_active, parent: :category do |category|
    category.category_name "Factory Girl Category Active"
    category.active true
  end

  factory :category_inactive, parent: :category do |category|
    category.category_name "Factory Girl Category Inactive"
    category.active false
  end
end
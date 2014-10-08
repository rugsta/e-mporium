FactoryGirl.define do
  sequence :product_name do |n|
    "Factory Girl Created Product #{n}"
  end

  factory :product do
    product_name { generate(:product_name)}
    note "This is a note from Factory Girl"
    price "19.99"
    category
    #association :image, factory: :image
    after(:product) do |i|
      i.images << FactoryGirl.build(:image)
      end
  end

  trait :with_id do
    category_id 1
  end

end
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :image do
    product_id 1
    image_file_name "dave.jpg"
    image_content_type "image/png"
    image_file_size 382357
  end

end

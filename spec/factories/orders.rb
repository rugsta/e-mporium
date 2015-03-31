# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    cart_id 1
    ip_address 1
    express_tokenID "MyString"
    express_payerID "MyString"
  end
end

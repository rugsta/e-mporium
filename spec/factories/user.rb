FactoryGirl.define do
  factory :user do |user|
    user.name "Factory Girl Created User"
    user.email "factory@girl.com.xx"
    user.password "qwerty"
    user.password_confirmation "qwerty"
  end

  factory :user_another, parent: :user do |user|
    user.name "Another Factory Girl Created User"
    user.email "another_factory@girl.com.xx"
    user.password "qwerty"
    user.password_confirmation "qwerty"
  end

end
FactoryBot.define do
  factory :user do
    name { "guys #{rand(10022)}" }
    sequence(:email) { |n| "somseguy_#{n}@gmail.com"}
    after(:build)  { |u| u.password_confirmation = u.password = "12345s" }
  end
end
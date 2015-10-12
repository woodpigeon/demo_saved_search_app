FactoryGirl.define do
  factory :account do
    email "me@example.com"
    password "12345678"
    password_confirmation { "12345678" }
  end
end
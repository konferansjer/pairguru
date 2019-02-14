FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password "pass1234"
    confirmed_at { Time.zone.now }
  end
end

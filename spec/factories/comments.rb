FactoryBot.define do
  factory :comment do
    movie
    user
    content { Faker::Lorem.sentence(3, true) }
  end
end

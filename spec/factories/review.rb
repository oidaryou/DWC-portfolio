FactoryBot.define do
  factory :review do
    review { Faker::Lorem.characters(number:5) }
  end
end
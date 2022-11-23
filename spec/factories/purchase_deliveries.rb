FactoryBot.define do
  factory :purchase_delivery do
    postcode     { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    place_id     { Faker::Number.between(from: 2, to: 48) }
    city         { Faker::Lorem.sentence }
    address      { Faker::Lorem.sentence }
    building     { Faker::Lorem.sentence }
    phone_number { Faker::Number.leading_zero_number(digits: 10) }
    token        { Faker::Lorem.characters(number: 30) }
  end
end

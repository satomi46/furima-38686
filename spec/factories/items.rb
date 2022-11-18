FactoryBot.define do
  factory :item do
    title              { Faker::Team.name }
    price              { Faker::Number.between(from: 300, to: 9999999) }
    explanation        { Faker::Lorem.sentence }
    shipping_cost_id   { Faker::Number.between(from: 2, to: 3) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    status_id          { Faker::Number.between(from: 2, to: 7) }
    place_id           { Faker::Number.between(from: 2, to: 48) }
    days_to_ship_id    { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/task.png'), filename: 'task.png')
    end
  end
end

FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(min_alpha:1,min_numeric:1,number:15)}
    password_confirmation {password}
    last_name             {Gimei.family.kanji}
    first_name            {Gimei.first.kanji}
    last_name_kana        {Gimei.family.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2017-01-01')}
  end
end
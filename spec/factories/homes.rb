FactoryBot.define do
  factory :home do
    home_name       { 'test' }
    age             { Faker::Date.in_date_period }
    name            { Gimei.kanji }
    tel             { Faker::Number.number(digits: 11) }
    email           { Faker::Internet.free_email }
    prefecture_id   { 2 }
    zone_id         { 2 }
    resident_id     { 2 }
    address         { 2 }
    price           { 3000 }
    rate            { 2.14 }
    rent            { 75_000 }
    management      { 1 }

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end

FactoryBot.define do
  factory :item do
    
    association :user
    association :category

    name            { Faker::Lorem.characters(number: 10) }
    explanation     { Faker::Lorem.characters(number: 100) }
    category_id     { category.id }
    brand           { Faker::Lorem.word }
    size            { Faker::Lorem.word }
    condition       { Faker::Lorem.word }
    delivery_fee    { Faker::Lorem.word }
    delivery_method { Faker::Lorem.word }
    prefecture      { Faker::Address.city }
    day             { Faker::Lorem.word }
    price           { Faker::Number.number(digits: 4)}
    seller_id       { user.id }
  end
end
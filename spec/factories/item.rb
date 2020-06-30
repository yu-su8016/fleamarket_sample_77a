FactoryBot.define do
  factory :item do
    
    association :user
    association :category

    name                { Faker::Lorem.characters(number: 10) }
    explanation         { Faker::Lorem.characters(number: 100) }
    category_id         { category.id }
    brand               { Faker::Lorem.word }
    size                { Faker::Lorem.word }
    condition_id        { Faker::Lorem.word }
    delivery_fee_id     { Faker::Lorem.word }
    delivery_method_id  { Faker::Lorem.word }
    prefecture_id       { Faker::Address.city }
    day_id              { Faker::Lorem.word }
    price               { Faker::Number.number(digits: 4)}
    seller_id           { user.id }
  end
end
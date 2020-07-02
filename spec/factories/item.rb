FactoryBot.define do
  factory :item do
    
    association :user
    association :category
  

    name                { Faker::Lorem.characters(number: 10) }
    explanation         { Faker::Lorem.characters(number: 100) }
    brand               { Faker::Lorem.word }
    size                { Faker::Lorem.word }
    condition_id        { Faker::Lorem.word }
    delivery_fee_id     { Faker::Lorem.word }
    delivery_method_id  { Faker::Lorem.word }
    prefecture_id       { Faker::Address.city }
    day_id              { Faker::Lorem.word }
    price               { Faker::Number.number(digits: 4)}

    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end

  factory :no_image_item, class: Item do
    association :user
    association :category
  

    name                { Faker::Lorem.characters(number: 10) }
    explanation         { Faker::Lorem.characters(number: 100) }
    brand               { Faker::Lorem.word }
    size                { Faker::Lorem.word }
    condition_id        { Faker::Lorem.word }
    delivery_fee_id     { Faker::Lorem.word }
    delivery_method_id  { Faker::Lorem.word }
    prefecture_id       { Faker::Address.city }
    day_id              { Faker::Lorem.word }
    price               { Faker::Number.number(digits: 4)}
  end

end
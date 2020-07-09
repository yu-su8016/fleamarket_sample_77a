FactoryBot.define do
  factory :item do
    
    association :user
    association :category
  

    name                { Faker::Lorem.characters(number: 10) }
    explanation         { Faker::Lorem.characters(number: 100) }
    brand               { Faker::Lorem.word }
    size                { Faker::Lorem.word }
    condition_id        { Faker::Number.within(range: 1..6) }
    delivery_fee_id     { Faker::Number.within(range: 1..2) }
    delivery_method_id  { Faker::Number.within(range: 1..3) }
    prefecture_id       { Faker::Number.within(range: 1..47) }
    day_id              { Faker::Number.within(range: 1..3) }
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
    condition_id        { Faker::Number.within(range: 1..6) }
    delivery_fee_id     { Faker::Number.within(range: 1..2) }
    delivery_method_id  { Faker::Number.within(range: 1..3) }
    prefecture_id       { Faker::Number.within(range: 1..47) }
    day_id              { Faker::Number.within(range: 1..3) }
    price               { Faker::Number.number(digits: 4)}
  end

end
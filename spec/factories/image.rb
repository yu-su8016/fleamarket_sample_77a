FactoryBot.define do
  factory :image do
    images { Faker::LoremPixel.image }
    item_id { item.id }
    association :item
  end
end
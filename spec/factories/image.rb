FactoryBot.define do
  factory :image do

    images { Faker::LoremPixel.image }

    
  end
end
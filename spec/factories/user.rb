FactoryBot.define do
  factory :user do
    email             { Faker::Internet.email }
    password          { Faker::Internet.password }
    nickname          { Faker::Internet.username }
    family_name       { '山田' }
    first_name        { '太郎' }
    family_name_kana  { 'やまだ' }
    first_name_kana   { 'たろう' }
    birthday          { Faker::Date.between(from: '1950-01-01', to: '2000-01-01') }
  end
end

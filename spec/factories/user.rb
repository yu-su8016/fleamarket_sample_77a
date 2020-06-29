FactoryBot.define do
  factory :user do
    id                { 1 }
    email             { Faker::Internet.email }
    password          { Faker::Internet.password }
    nickname          { Faker::Internet.username }
    family_name       { Gimei.last.kanji }
    first_name        { Gimei.first.kanji }
    family_name_kana  { Gimei.last.katakana }
    first_name_kana   { Gimei.first.katakana }
    birthday          { Faker::Date.between(from: '1950-01-01', to: '2000-01-01') }
  end
end
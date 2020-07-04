FactoryBot.define do
  factory :user do
    password = Faker::Internet.password
    email                   { Faker::Internet.email }
    password                { password }
    password_confirmation   { password }
    nickname                { Faker::Internet.username }
    family_name             { Gimei.last.kanji }
    first_name              { Gimei.first.kanji }
    family_name_kana        { Gimei.last.hiragana }
    first_name_kana         { Gimei.first.hiragana }
    birthday                { Faker::Date.between(from: '1950-01-01', to: '2000-01-01') }
  end
end

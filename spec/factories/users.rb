FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"0000000"}
    password_confirmation {"0000000"}
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    birthday              {"2000-01-01"}
  end
end
# password = Faker::Internet.password(min_length: 7)
# sequence(:email) {Faker::Internet.email}
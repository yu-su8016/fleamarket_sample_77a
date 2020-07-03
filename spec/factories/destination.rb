FactoryBot.define do
  factory :destination do
    association :user
    family_name           {"山田"}
    first_name            {"太郎"}
    family_name_kana      {"やまだ"}
    first_name_kana       {"たろう"}
    postal_code           {"0000000"}
    prefecture_id         {"愛知県"}
    city                  {"名古屋市"}
    address               {"1-1"}
  end
end
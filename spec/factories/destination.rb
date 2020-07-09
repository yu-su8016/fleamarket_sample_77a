FactoryBot.define do
  factory :destination do
    association :user
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_name_kana      { Gimei.last.hiragana }
    first_name_kana       { Gimei.first.hiragana }
    postal_code           {"0000000"}
    prefecture_id         {"愛知県"}
    city                  {"名古屋市"}
    address               {"1-1"}
  end
end
FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"田中"}
    first_name_kana       {"タナカ"}
    last_name_kana        {"タロウ"}
    birthday              {Faker::Date::birthday}

  end
end
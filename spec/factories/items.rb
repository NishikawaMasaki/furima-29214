FactoryBot.define do
  factory :item do
    name             {"aaaaaa"}
    explain          {"あああああ"}
    price            {"999999"}
    category_id      {"2"}
    status_id        {"2"}
    shipping_fee_id  {"2"}
    area_id          {"2"}
    day_id           {"2"}
    association :user
  end
end

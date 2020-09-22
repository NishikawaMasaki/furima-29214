FactoryBot.define do
  factory :order_address do
    token       {"tok_abcde12345"}
    postal      {"583-0882"}
    prefecture  {"2"}
    city        {"大阪府羽曳野市高鷲10丁目"}
    address     {"6-24"}
    building    {"セイワコートプレミアム1B"}
    tel         {"09012345678"}
    association :user
    association :item   
  end
end

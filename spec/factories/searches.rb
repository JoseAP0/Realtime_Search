FactoryBot.define do
  factory :search do
    user_ip { Faker::Provider.ipv4 }
    query { Faker::Lorem.sentence }
  end
end

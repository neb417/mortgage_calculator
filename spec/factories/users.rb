FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'password' }
    api_key { SecureRandom.urlsafe_base64 }
  end
end

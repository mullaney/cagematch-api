FactoryBot.define do
  factory :admin_user do
    email { "me@example.com" }
    password { "password" }
    password_confirmation { "password"}
  end
end

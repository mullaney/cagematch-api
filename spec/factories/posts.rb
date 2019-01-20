FactoryBot.define do
  factory :post do
    title { "MyString" }
    author { "MyString" }
    category { "MyString" }
    text { "MyText" }
    published_at { "2019-01-19 17:42:16" }
    cagematch
    admin_user
  end
end

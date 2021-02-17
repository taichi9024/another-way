FactoryBot.define do
  factory :user do
    email { 'fuge@gmail.com' }
    name { 'hoge' }
    password { 'hogehoge' }
  end
end

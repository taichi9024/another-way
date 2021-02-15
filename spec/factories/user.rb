FactoryBot.define do
  factory :user do
    email { 'hoge@gmail.com' }
    name { 'hoge' }
    password { 'hogehoge' }
  end
end

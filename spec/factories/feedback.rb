FactoryBot.define do
  factory :feedback do
    content { 'h' * 21 }
    email { 'hoge@hoge.com' }
  end
end

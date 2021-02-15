FactoryBot.define do
  factory :space do
    name  { 'hoge' }
    pref  { 'hoge' }
    city  { 'hoge' }
    detailaddress { 'hoge' }
    station { 'hoge' }
    station_walk { 3 }
    price { 1000 }
    tel { 90_111_111 }
    seat { 3 }
    association :user
    description { 'hoghogehoge' }
  end
end

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    active true
    blurb { Faker::Lorem.paragraph }
    title { Faker::Lorem.words }
    groups { [create(:group)] }
  end
end

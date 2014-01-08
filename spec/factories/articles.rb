FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    blurb { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    type 'Feature'
    published true
    allow_comments true
    users { [create(:user)] }
  end
end

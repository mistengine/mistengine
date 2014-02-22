FactoryGirl.define do
  factory :cover do
    article
    active true
    weight 0
    image  { File.new(Rails.root.join("spec", "support", "cover_image.jpg")) }

    trait :no_article do
      title { Faker::Lorem.words }
      url { Faker::Internet.url }
    end
  end
end

FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    blurb { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    published true
    allow_comments true
    users { [create(:user)] }

    factory :feature, class: Feature do
      type 'Feature'
    end
    factory :review, class: Review do
      type 'Review'
    end
    factory :preview, class: Preview do
      type 'Preview'
    end
    factory :interview, class: Interview do
      type 'Interview'
    end
    factory :news, class: News do
      type 'News'
    end
  end
end

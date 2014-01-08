FactoryGirl.define do
  factory :group do
    title { Faker::Lorem.words }
    active true
    permissions {
      {
        'admin' => {
          'can_view_admincp' => "1"
        },
        'articles' => {
          'can_create_articles' => "0",
          'can_edit_articles' => "0"
        }
      }
    }
  end
end
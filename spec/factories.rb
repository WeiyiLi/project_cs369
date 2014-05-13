FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :series do
    name "Series X"
  end

  factory :episode do
    name "Episode X"
    season 1
    number 1
    series_id 1
  end
end
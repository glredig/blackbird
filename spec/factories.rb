FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "password"
    password_confirmation "password"
  end

  factory :admin_user do
    admin true
  end

  factory :event do
      summary "Blackbird will be playing at the park"
      accessible 1
      location "Aslan Studios, Beaverton, OR 97007"
      date Date.today
      pay 250000
  end
end
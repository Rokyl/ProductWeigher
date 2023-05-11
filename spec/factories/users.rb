FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3,"0")}@example.com"}
    password {1111}
  end
end

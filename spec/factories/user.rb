FactoryBot.define do
  factory :user do
    sequence(:email)      { |n| "dev+user#{n + 1}@example.com" }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end

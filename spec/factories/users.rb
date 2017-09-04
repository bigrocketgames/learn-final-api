FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'password'
  end

  factory :fan, parent: :user do
    email 'test1@test.com'
    password 'password'
  end
end

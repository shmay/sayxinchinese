# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    name 'John Doe'
    email 'kmurph73@gmail.com'
    password "password"
    password_confirmation "password"
  end
end

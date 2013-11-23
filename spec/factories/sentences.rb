# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sentence do
    sentence 'hey hey hey'
    convert_id 1
    language_id 1
  end
end

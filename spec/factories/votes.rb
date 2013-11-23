# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :vote do
    trait :downboat do
      direction -1
    end

    trait :upboat do
      direction 1
    end

    trait :answer do
      sequence(:answer_id) {|n| n}
    end

    trait :sentence do
      sequence(:sentence_id) {|n| n}
    end

    trait :other_user do
      # don't use 1
      sequence(:user_id) {|n| n + 2}
    end

    factory :upboat_for_answer, traits: [:upboat, :answer]
    factory :downboat_for_answer, traits: [:downboat, :answer]
    factory :rand_user_boat, traits: [:upboat, :other_user]
  end
end

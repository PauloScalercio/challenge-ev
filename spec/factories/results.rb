FactoryBot.define do
  factory :result_from_competition_with_only_one_attempt, class: Result do
    association :competition, factory: :competition_with_only_one_attempt
    athlete
    result_value 77.77
  end

  factory :result_from_competition_with_more_then_one_attempt, class: Result do
    association :competition, factory: :competition_with_more_then_one_attempt
    athlete
    result_value 18.10
  end
end

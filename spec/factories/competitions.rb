FactoryBot.define do
  factory :competition_with_only_one_attempt, class: Competition do
    name 'corrida no saco de batata'
    unit 's'
  end

  factory :competition_with_more_then_one_attempt, class: Competition do
    name 'Cabra-cega'
    unit 'm'
    max_attempts 3
  end
end

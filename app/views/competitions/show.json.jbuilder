json.extract! @competition, :id, :name, :unit, :win_definition, :max_attempts, :finished
json.ranking @competition.define_rank do |result|
  json.athlete_name result.athlete.name
  json.athlete_id result.athlete.id
  json.extract! result, :result_value
end

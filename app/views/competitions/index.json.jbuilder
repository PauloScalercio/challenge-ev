json.array! @competitions do |competition|
  json.extract! competition, :id, :name, :unit, :win_definition, :max_attempts, :finished
  json.url competition_url(competition, format: :json)
end

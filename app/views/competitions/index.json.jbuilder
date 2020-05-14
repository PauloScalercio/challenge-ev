json.array! @competitions do |competition|
  json.url competition_url(competition, format: :json)
  json.extract! competition, :id, :name, :unit, :win_definition, :max_attempts, :finished
end

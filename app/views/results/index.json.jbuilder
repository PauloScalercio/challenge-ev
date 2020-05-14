json.array! @results do |result|
  json.extract! result, :id, :result_value, :athlete, :competition
end

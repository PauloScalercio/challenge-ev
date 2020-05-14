json.extract! @result, :id, :result_value
json.competition_name @result.competition.name
json.athlete_name @result.athlete.name


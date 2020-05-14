json.extract! @result, :id, :result_value
json.athlete_name @result.athlete.name
json.competition_name @result.competition.name

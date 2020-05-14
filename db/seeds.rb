puts 'STARTED POPULATING DB'

puts 'Create 2 competitions'
race = Competition.create(
  name: "100m classificatoria 1",
  unit: "s",
  win_definition: :min)

darts_throw = Competition.create(
  name: "Dardo",
  unit: "m",
  max_attempts: 3)

puts 'Create 10 athletes'
10.times do |i|
  athlete = Athlete.new(name: "placeholder #{i}")
  athlete.save!
end

puts 'Create 5 results for the race competition'
athletes = (1..10).to_a
5.times do
  result = Result.new(
    competition_id: 1,
    athlete_id: athletes.sample,
    result_value: rand(1..100)
  )
  result.save!
  athletes.delete(result.athlete_id)
end

puts 'Create 30 results for the dart competition'
athletes = (1..10).to_a * 3
30.times do
  result = Result.new(
    competition_id: 2,
    athlete_id: athletes.sample,
    result_value: rand(1..100)
  )
  result.save!
  athletes.slice!(athletes.index(result.athlete_id))
end

puts 'FINISHED POPULATING DB'

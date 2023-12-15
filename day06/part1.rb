input = File.open('input.txt').read

time_entries, distance_entries = input.split("\n").map { |line| line.split(':').last.split(' ') }

results = []
time_entries.length.times do |i|
  solutions = 0
  time = time_entries[i].to_i
  distance = distance_entries[i].to_i
  (0..time).each do |ms|
    solutions += 1 if ((ms * (time - ms)) > distance)
  end
  results << solutions
end

puts results.reduce(:*)

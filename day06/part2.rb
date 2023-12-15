input = File.open('input.txt').read

time_entry, distance_entry = input.split("\n").map { |line| line.split(':').last.gsub(/\s+/, '').to_i }

solutions = 0
(1..time_entry).each do |ms|
  solutions += 1 if ((ms * (time_entry - ms)) > distance_entry)
end

puts solutions

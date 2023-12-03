input = File.open('input.txt').read
lines = input.split("\n").map { |line| line.split('').select { |char| char.to_i != 0 } }
puts lines.map { |line| (line.first + line.last).to_i }.sum

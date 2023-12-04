input = File.open('input.txt').read

games = input.split("\n").map do |line|
  line.split(': ').last.split(' | ').map { |numbers| numbers.split(' ').map(&:to_i) }
end

total = 0
games.each do |game|
  matches = (game[0] & game[1]).length
  if matches > 0
    total += (matches - 1).times.inject(1) { |sum, _| sum * 2 }
  end
end

puts total

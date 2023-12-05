input = File.open('input.txt').read

games = input.split("\n").map do |line|
  line.split(': ').last.split(' | ').map { |numbers| numbers.split(' ').map(&:to_i) }
end

games.each do |game|
  game << 1
end

index = 0
while true
  game = games[index]

  matches = (game[0] & game[1]).length
  if matches > 0
    (1..matches).each do |i|
      new_game = games[index + i]
      new_game[2] += game[2]
    end
  end

  index += 1

  break if index == games.length
end

puts games.collect(&:last).sum

def get_max(turns, color)
  color_nums = turns.map do |turn|
    match = turn.match(/(\d+) #{color}/)
    match ? match[-1].to_i : 0
  end
  color_nums.max
end

def get_max_colors(turns)
  [
    get_max(turns, 'red'),
    get_max(turns, 'green'),
    get_max(turns, 'blue')
  ]
end

input = File.open('input.txt').read
games = {}

games = input.split("\n").map do |line| 
  line.split(': ').last.split('; ')
end

powers = games.map { |game| get_max_colors(game).inject(:*) }

puts powers.sum

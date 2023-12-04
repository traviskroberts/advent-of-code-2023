RED_LIMIT = 12
GREEN_LIMIT = 13
BLUE_LIMIT = 14

def has_illegal_turn?(turns)
  turns.any? { |turn| exceeds_limit?(turn) }
end

def exceeds_limit?(turn)
  get_num(turn, 'red') > RED_LIMIT ||
  get_num(turn, 'green') > GREEN_LIMIT ||
  get_num(turn, 'blue') > BLUE_LIMIT
end

def get_num(turn, color)
  match = turn.match(/(\d+) #{color}/)
  match ? match[-1].to_i : 0
end

input = File.open('input.txt').read
games = {}

input.split("\n").each do |line| 
  game_num = line.match(/Game (?<num>\d+):/)['num']
  turns = line.split(': ').last.split('; ')
  games[game_num] = turns
end

bad_games = games.map do |game_num, turns|
  unless has_illegal_turn?(turns)
    game_num.to_i
  end
end

puts bad_games.compact.sum

input = File.open('input.txt').read
char_map = {
  'one' => 1, 
  'two' => 2, 
  'three' => 3, 
  'four' => 4,
  'five' => 5,
  'six' => 6,
  'seven' => 7,
  'eight' => 8,
  'nine' => 9
}
num_regex = char_map.keys.join('|')

lines = input.split("\n").compact
num_arrays = lines.map do |line| 
  first_num = line.scan(Regexp.new("[0-9]|#{num_regex}")).first
  last_num = line.reverse.scan(Regexp.new("[0-9]|#{num_regex.reverse}")).first
  "#{char_map[first_num] || first_num}#{char_map[last_num.reverse] || last_num}".to_i
end
puts num_arrays.sum

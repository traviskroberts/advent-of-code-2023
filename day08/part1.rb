input = File.open('input.txt').read

parts = input.split("\n\n")
instructions = parts.first.chars
nodes = {}
parts.last.gsub(/[(,)]/, '').split("\n").map do |n|
  k, v = n.split(' = ')
  nodes[k] = v.split(' ')
end

current_node = nodes['AAA']
cycles = 0
instructions.cycle do |instruction|
  cycles += 1
  if instruction == 'L'
    node_map = current_node[0]
  elsif instruction == 'R'
    node_map = current_node[1]
  end

  break if node_map == 'ZZZ'

  current_node = nodes[node_map]
end

puts cycles

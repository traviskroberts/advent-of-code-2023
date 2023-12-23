def get_line_diffs(line)
  line.each_cons(2).map { |pair| pair.last - pair.first }
end

def diff_of_next_line(line)
  next_line = get_line_diffs(line)
  if next_line.all?(&:zero?)
    return line.last + 0
  end

  line.last + diff_of_next_line(next_line)
end

input = File.open('input.txt').read

lines = input.split("\n").map { |line| line.split(' ').map(&:to_i) }

totals = lines.map do |line|
  diff_of_next_line(line)
end

puts totals.sum

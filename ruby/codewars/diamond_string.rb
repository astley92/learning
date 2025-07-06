# https://www.codewars.com/kata/5503013e34137eeeaa001648/train/ruby

#   *
#  ***
# *****
#  ***
#   *

require("benchmark")
require("benchmark/memory")

class AssertionMissedError < StandardError; end

def assert_eq(a, b)
  raise AssertionMissedError.new("Assertion not met\n\t#{a.inspect} != #{b.inspect}\n") unless a == b
end

def diamond(size)
  return if size.even? || size.negative?

  midpoint = size / 2
  result = []
  size.times do |depth|
    leading_space = (midpoint - depth).abs
    char_count = size - (leading_space * 2)
    result << (" " * leading_space) + ("*" * char_count)
  end
  result.join("\n") + "\n"
end


# - [x] Only run through half the computations and just reverse the list when generating 
# output.
def diamond_v2(size)
  return if size.even? || size.negative?
  return "*\n" if size == 1

  midpoint = size / 2
  result = []
  (0..midpoint).each do |depth|
    leading_space = (midpoint - depth).abs
    char_count = size - (leading_space * 2)
    result << (" " * leading_space) + ("*" * char_count)
  end
  result.join("\n") + "\n" + result.reverse[1..].join("\n") + "\n"
end

assert_eq(diamond(-1), nil)
assert_eq(diamond(0), nil)
assert_eq(diamond(2), nil)
assert_eq(diamond(3), " *\n***\n *\n")
assert_eq(diamond(1), "*\n")

assert_eq(diamond_v2(-1), nil)
assert_eq(diamond_v2(0), nil)
assert_eq(diamond_v2(2), nil)
assert_eq(diamond_v2(3), " *\n***\n *\n")
assert_eq(diamond_v2(1), "*\n")

puts "#{diamond(51)}"

n = 500
Benchmark.bmbm do |x|
  x.report("Simple") do
    n.times { |a| diamond(a) }
  end
  
  x.report("V2") do
    n.times { |a| diamond_v2(a) }
  end
end

Benchmark.memory do |x|
  x.report("Simple") do
    n.times { |a| diamond(a) }
  end
  
  x.report("V2") do
    n.times { |a| diamond_v2(a) }
  end
end

# Rehearsal ------------------------------------------
# Simple   0.026061   0.001837   0.027898 (  0.027949)
# V2       0.013630   0.002760   0.016390 (  0.016433)
# --------------------------------- total: 0.044288sec
# 
#              user     system      total        real
# Simple   0.022114   0.000874   0.022988 (  0.023045)
# V2       0.013326   0.002527   0.015853 (  0.015901)
# Calculating -------------------------------------
#               Simple    89.384M memsize (     0.000  retained)
#                        313.750k objects (     0.000  retained)
#                         50.000  strings (     0.000  retained)
#                   V2    84.198M memsize (     0.000  retained)
#                        160.108k objects (     0.000  retained)
#                         50.000  strings (     0.000  retained)

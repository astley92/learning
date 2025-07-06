# https://www.codewars.com/kata/5503013e34137eeeaa001648/train/ruby

#   *
#  ***
# *****
#  ***
#   *

class AssertionMissedError < StandardError; end

def assert_eq(a, b)
  raise AssertionMissedError.new("Assertion not met\n\t#{a.inspect} != #{b.inspect}\n") unless a == b
end

def diamond(size)
  return if size.even? || size.negative?

  midpoint = size / 2
  result = []
  size.times do |depth|
    if depth == midpoint
      result << "*" * size
    else
      leading_space = (midpoint - depth).abs
      char_count = size - (leading_space * 2)
      result << (" " * leading_space) + ("*" * char_count)
    end
  end
  result.join("\n") + "\n"
end

assert_eq(diamond(-1), nil)
assert_eq(diamond(0), nil)
assert_eq(diamond(2), nil)
assert_eq(diamond(3), " *\n***\n *\n")
assert_eq(diamond(1), "*\n")

puts "#{diamond(51)}"

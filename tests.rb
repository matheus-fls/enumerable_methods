# frozen_string_literal: true

require './enumerables'
require 'test/unit'
extend Test::Unit::Assertions

# Tests for my_each:
puts 'Tests for my_each:'
[11, 22, 33].my_each { |n| puts "#{n} works!" }
my_hash = { bla: 23, bla2: 25, three: 3, seven: 7 }
my_hash.my_each { |key, value| puts "#{key}: #{value}" }
puts

# Tests for my_each_with_index:
puts 'Tests for my_each_with_index: '
ex = [11, 22, 33]

ex.my_each_with_index { |value, index| puts "value: #{value} index: #{index}" }

my_hash.my_each_with_index { |k, v, i| puts "k: #{k} v: #{v} i: #{i}" }
puts

# Tests for my_select:
puts 'Tests for my_select:'
numbers = [1, 2, 3, 4, 5]

assert_equal(numbers.my_select { |n| n > 3 }, numbers.my_select { |n| n > 3 })
puts(numbers.my_select { |number| number > 3 })

puts(my_hash.my_select { |_key, value| value > 10 })
puts

# Tests for my_all?
assert_equal(numbers.my_all? { |n| n > 1 }, numbers.all? { |n| n > 1 })
puts 'Tests for my_all: '
puts(numbers.my_all? { |n| n > 1 })
puts

# Tests for my_any?
assert_equal(numbers.my_any? { |n| n == 3 }, numbers.any? { |n| n == 3 })
puts 'Tests for my_any?: '
puts(numbers.my_any? { |n| n == 3 })
puts

# Tests for my_none?
assert_equal(numbers.my_none? { |n| n == 3 }, numbers.none? { |n| n == 3 })
puts 'Tests for my_none?:'
puts(numbers.my_none? { |n| n == 3 })
puts(numbers.my_none? { |n| n == 11 })
puts

# Tests for my_count
assert_equal(numbers.my_count, numbers.count)
puts 'Tests for my_count:'
numbers << 2
puts(numbers.my_count)
puts(numbers.my_count(2))
puts(numbers.my_count { |n| (n % 2).zero? })

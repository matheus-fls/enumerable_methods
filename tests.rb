# frozen_string_literal: true

require './enumerables'

# Tests for my_each:

[11, 22, 33].my_each { |n| puts "#{n} works!" }
my_hash = { bla: 23, bla2: 25, three: 3, seven: 7 }
my_hash.my_each { |key, value| puts "#{key}: #{value}" }

# Tests for my_each_with_index:

ex = [11, 22, 33]

ex.my_each_with_index { |value, index| puts "value: #{value} index: #{index}" }

my_hash.my_each_with_index { |key, value, index| puts "key: #{key} value: #{value} index: #{index}" }

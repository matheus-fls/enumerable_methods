# frozen_string_literal: true

# :nodoc:
module Enumerable
  def my_each
    my_array = to_a
    cont = 0
    while cont < length
      yield(my_array[cont])
      cont += 1
    end
  end

  def my_each_with_index
    my_array = to_a
    cont = 0
    while cont < length
      yield(my_array[cont], cont)
      cont += 1
    end
  end

  def my_select
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << my_array[cont] if yield(*my_array[cont])
      cont += 1
    end
    return result.to_h if is_a? Hash

    result
  end

  def my_all?
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << my_array[cont] if yield(*my_array[cont])
      cont += 1
    end
    result == my_array
  end

  def my_any?
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << my_array[cont] if yield(*my_array[cont])
      cont += 1
    end
    result.length.positive?
  end

  def my_none?
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << my_array[cont] if yield(*my_array[cont])
      cont += 1
    end
    result.length.zero?
  end

  def my_count(value = nil, &block)
    return length if value.nil? && !block_given?

    filter = if block_given?
               block
             else
               proc { |n| n == value }
             end
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << my_array[cont] if filter.call(my_array[cont])
      cont += 1
    end
    result.length
  end

  def my_map(proc = nil, &block)
    block = proc unless proc.nil?
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << block.call(*my_array[cont])
      cont += 1
    end
    result
  end

  def my_inject(memo = nil)
    my_array = to_a
    cont = 0
    if memo.nil?
      memo = my_array[0]
      cont += 1
    end
    while cont < my_array.length
      memo = yield(memo, my_array[cont])
      cont += 1
    end
    memo
  end
end

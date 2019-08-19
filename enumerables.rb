# frozen_string_literal: true

# :nodoc:
module Enumerable
  def my_each
    my_array = to_a
    cont = 0
    while cont < length
      yield(*my_array[cont])
      cont += 1
    end
  end

  def my_each_with_index
    my_array = to_a
    cont = 0
    while cont < length
      yield(*my_array[cont], cont)
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

  def my_count(value=nil)
    my_array = to_a
    cont = 0
    result = []
    if !value.nil?
      while cont < length
        result << my_array[cont] if my_array[cont] == value
        cont += 1
      end
      result.length
    elsif block_given?
      while cont < length
        result << my_array[cont] if yield(*my_array[cont])
        cont += 1
      end
      result.length
    else
      my_array.length
    end
  end

  def my_map
    my_array = to_a
    cont = 0
    result = []
    while cont < length
      result << yield(*my_array[cont])
      cont += 1
    end
    result
  end
end

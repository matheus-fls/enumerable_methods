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
end

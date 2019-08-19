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
end

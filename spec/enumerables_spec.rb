# frozen_string_literal: true

require_relative '../enumerables.rb'

# Tests
RSpec.describe Enumerable do
  let(:arr) { [1, 2, 3, 4, 5] }
  let(:my_hash) { { one: 1, two: 2, three: 3, four: 4 } }

  describe 'my_select' do
    it 'Filters the values from an array according to a given condition' do
      expect(arr.my_select(&:odd?)).to eql(arr.select(&:odd?))
    end

    it 'Filters the values from a hash according to a given condition' do
      expect(my_hash.my_select { |_key, value| value.odd? }).to eql(my_hash.select { |_key, value| value.odd? })
    end
  end

  describe 'my_all?' do
    it 'Checks if all items in an array comply with a given condition' do
      expect(arr.my_all?(&:positive?)).to eql(arr.all?(&:positive?))
    end

    it 'Checks if all items in a hash comply with a given condition' do
      expect(my_hash.my_all? { |_key, value| value.positive? }).to eql(my_hash.all? { |_key, value| value.positive? })
    end
  end

  describe 'my_any?' do
    it 'Checks if any item in an array complies with a given condition' do
      expect(arr.my_any?(&:negative?)).to eql(arr.any?(&:negative?))
    end

    it 'Checks if any item in a hash complies with a given condition' do
      expect(my_hash.my_any? { |_key, value| value.negative? }).to eql(my_hash.any? { |_key, value| value.negative? })
    end
  end

  describe 'my_count' do
    it 'Counts all the items in an array that complies with a given condition' do
      expect(arr.my_count(&:odd?)).to eql(arr.count(&:odd?))
    end

    it 'Counts all the items in a hash that complies with a given condition' do
      expect(my_hash.my_count { |_key, value| value.odd? }).to eql(my_hash.count { |_key, value| value.odd? })
    end

    it 'Counts all the items in an array' do
      expect(arr.my_count).to eql(arr.count)
    end

    it 'Counts all the items in a hash' do
      expect(my_hash.my_count).to eql(my_hash.count)
    end
  end

  describe 'my_map' do
    it 'Applies a block over an array and returns the result' do
      expect(arr.my_map { |x| x**2 }).to eql(arr.map { |x| x**2 })
    end
    it 'Applies a block over a hash and returns the result' do
      expect(my_hash.my_map { |_, x| x**2 }).to eql(my_hash.map { |_, x| x**2 })
    end
  end

  describe 'my_inject' do
    it 'Calculates the sum of the squares of the numbers in the array' do
      expect(arr.my_inject { |acc, x| acc + x**2 }).to eql(arr.inject { |acc, x| acc + x**2 })
    end
    it 'Converts a hash to an indexed list of key values' do
      expect(my_hash.my_inject([]) { |acc, pair| acc[pair.last] = pair.first; acc }) # rubocop:disable Style/Semicolon
        .to eql(my_hash.inject([]) { |acc, pair| acc[pair.last] = pair.first; acc }) # rubocop:disable Style/Semicolon
    end
  end
end

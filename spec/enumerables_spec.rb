# frozen_string_literal: true

require_relative '../enumerables.rb'

arr = [1, 2, 3, 4, 5]
my_hash = { one: 1, two: 2, three: 3, four: 4 }

# Tests
RSpec.describe Enumerable do
  describe 'my_select' do
    it 'same as select with array' do
      expect(arr.my_select(&:odd?)).to eql(arr.select(&:odd?))
    end

    it 'same as select with hash' do
      expect(my_hash.my_select { |_key, value| value.odd? }).to eql(my_hash.select { |_key, value| value.odd? })
    end
  end

  describe 'my_all?' do
    it 'same as all?' do
      expect(arr.my_all?(&:positive?)).to eql(arr.all?(&:positive?))
    end

    it 'same as all?' do
      expect(my_hash.my_all? { |_key, value| value.positive? }).to eql(my_hash.all? { |_key, value| value.positive? })
    end
  end

  describe 'my_any?' do
    it 'same as any?' do
      expect(arr.my_any?(&:negative?)).to eql(arr.any?(&:negative?))
    end

    it 'same as any?' do
      expect(my_hash.my_any? { |_key, value| value.negative? }).to eql(my_hash.any? { |_key, value| value.negative? })
    end
  end

  describe 'my_count' do
    it 'same as count for array' do
      expect(arr.my_count(&:odd?)).to eql(arr.count(&:odd?))
    end

    it 'same as count for hash' do
      expect(my_hash.my_count { |_key, value| value.odd? }).to eql(my_hash.count { |_key, value| value.odd? })
    end

    it 'same as count for array' do
      expect(arr.my_count).to eql(arr.count)
    end

    it 'same as count for hash' do
      expect(my_hash.my_count).to eql(my_hash.count)
    end
  end

  describe 'my_map' do
    it 'same as map for array' do
      expect(arr.my_map { |x| x**2 }).to eql(arr.map { |x| x**2 })
    end
    it 'same as map for hash' do
      expect(my_hash.my_map { |_, x| x**2 }).to eql(my_hash.map { |_, x| x**2 })
    end
  end

  describe 'my_inject' do
    it 'same as inject for array' do
      expect(arr.my_inject { |acc, x| 2 * acc + x }).to eql(arr.inject { |acc, x| 2 * acc + x })
    end
    it 'same as inject for hash' do
      expect(my_hash.my_inject { |acc, pair| acc[pair.last] = pair; acc }) # rubocop:disable Style/Semicolon
        .to eql(my_hash.inject { |acc, pair| acc[pair.last] = pair; acc }) # rubocop:disable Style/Semicolon
    end
  end
end

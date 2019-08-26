# frozen_string_literal: true

require_relative '../enumerables.rb'

arr = [1, 2, 3, 4]
my_hash = {one: 1, two: 2, three: 3, four: 4}

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
      expect(my_hash.my_any? { |_key, value| value.negative? }).to eql(my_hash.any?{ |_key, value| value.negative? })
    end
  end
end

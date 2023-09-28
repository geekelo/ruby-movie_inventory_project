# spec/item_spec.rb

require_relative '../lib/item'

describe Item do
  let(:item) { Item.new('Sample Title', '2010-01-01') }

  describe '#can_be_archived?' do
    it 'returns true if published_date is older than 10 years' do
      expect(item.can_be_archived?).to be true
    end

    it 'returns false if published_date is less than 10 years old' do
      item = Item.new('Sample Title', (Date.today - 5).to_s)
      expect(item.can_be_archived?).to be false
    end
  end

  describe '#move_to_archive' do
    it 'archives the item if it can be archived' do
      expect(item.move_to_archive).to be true
      expect(item.archived).to be true
    end

    it 'does not archive the item if it cannot be archived' do
      item = Item.new('Sample Title', (Date.today - 5).to_s)
      expect(item.move_to_archive).to be false
      expect(item.archived).to be false
    end
  end

  # Add more tests for other methods as needed
end

# spec/source_spec.rb

require_relative '../lib/source'

describe Source do
  let(:source) { Source.new('Sample Source') }

  describe '#add_item' do
    it 'adds an item to the source' do
      item = Item.new('Sample Title', '2010-01-01')
      source.add_item(item)
      expect(source.items).to include(item)
    end

    it 'sets the source of the item' do
      item = Item.new('Sample Title', '2010-01-01')
      source.add_item(item)
      expect(item.source).to eq(source)
    end
  end

  # Add more tests for other methods as needed
end

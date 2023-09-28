class Source
  attr_accessor :items, :name

  def initialize(name)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item
  end
end

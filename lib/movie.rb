class Movie < Item
  attr_accessor :silent, :title

  def initialize(title, publish_date, silent: false)
    super(title, publish_date)
    @silent = silent
  end

  def source=(source)
    @source = source || 'unknown'
  end

  def can_be_archived?
    super || @silent
  end

  def to_json(*_args)
    {
      title: @title,
      publish_date: @publish_date.to_s,
      archived: @archived,
      source: @source
    }
  end

  def self.from_json(json)
    data = JSON.parse(json)
    item = new(data['title'], data['publish_date'])
    item.archived = data['archived']
    item.source = data['source']
    item
  end
end

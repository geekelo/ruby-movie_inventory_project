class Movie < Item
  attr_accessor :silent, :title
  def initialize(title, publish_date, silent: false)
    super(title, publish_date)
    @silent = silent
  end

  def can_be_archived?
    if super || @silent
      return true
    else
      false
    end
  end

  def to_json
    {
      title: @title,
      publish_date: @publish_date.to_s,
      archived: @archived,
      genre: @genre,
      author: @author,
      source: @source,
      label: @label
    }
  end

  def self.from_json(json)
    data = JSON.parse(json)
    item = self.new(data['title'], data['publish_date'])
    item.archived = data['archived']
    item.genre = data['genre']
    item.author = data['author']
    item.source = data['source']
    item.label = data['label']
    item
  end
end

require 'date'

class Item
  attr_accessor :title, :genre, :author, :source, :label, :archived, :publish_date

  def initialize(title, publish_date, archived: false)
    @id = rand(1_000_000)
    @publish_date = Date.parse(publish_date)
    @title = title
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
  end

  def title=(title)
    @title = title
  end

  def can_be_archived?
    curr_date = Date.today
    curr_year = curr_date.year
    year_diff = curr_year - @publish_date.year
    year_diff > 10
  end

  def move_to_archive
    @archived = can_be_archived?
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

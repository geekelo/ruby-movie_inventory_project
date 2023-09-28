require 'date'

class Item
  attr_accessor :title, :genre, :author, :source, :label, :archived, :publish_date

  def initialize(title, publish_date, archived: false)
    @id = rand(1_000_000)
    @publish_date = Date.parse(publish_date)
    @title = title
    @archived = archived
  end

  attr_writer :genre, :author, :source, :label, :title

  def can_be_archived?
    curr_date = Date.today
    curr_year = curr_date.year
    year_diff = curr_year - @publish_date.year
    year_diff > 10
  end

  def move_to_archive
    @archived = can_be_archived?
  end
end

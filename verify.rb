require_relative 'lib/item'
require_relative 'lib/movie'

movie1 = Movie.new('Grow', '12-12-2022')
puts movie1.can_be_archived?
# spec/movie_spec.rb

require_relative '../lib/movie'

describe Movie do
  let(:movie) { Movie.new('Sample Movie', '2010-01-01', silent: true) }

  describe '#can_be_archived?' do
    it 'returns true if silent is true' do
      expect(movie.can_be_archived?).to be true
    end

    it 'returns true if published_date is older than 10 years' do
      movie = Movie.new('Sample Movie', '2000-01-01')
      expect(movie.can_be_archived?).to be true
    end

    it 'returns false if published_date is less than 10 years old and silent is false' do
      movie = Movie.new('Sample Movie', (Date.today - 5).to_s)
      expect(movie.can_be_archived?).to be false
    end
  end

  # Add more tests for other methods as needed
end

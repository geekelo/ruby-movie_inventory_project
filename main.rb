require_relative 'lib/item'
require_relative 'lib/movie'
require_relative 'lib/source'
require 'json'

# Load existing data from JSON files (if any)
def load_data
  items = []
  if File.exist?('data/items.json')
    File.open('data/items.json', 'r') do |file|
      file.each_line do |line|
        items << Item.from_json(line)
      end
    end
  end
  items
end

# Save data to JSON files
def save_data(items)
  File.open('data/items.json', 'w') do |file|
    items.each do |item|
      file.puts JSON.dump(item.to_json)
    end
  end
end

# Initialize items
items = load_data

loop do
  puts "Select an option:"
  puts "1. List all movies"
  puts "2. List all sources"
  puts "3. Add a movie"
  puts "4. Add movie source"
  puts "5. Quit"

  choice = gets.chomp.to_i

  case choice
  when 1
    puts "List of Movies:"
    items.each do |item|

        puts "- Title: #{item.title}, Genre: #{item.genre}, Published: #{item.publish_date}, Archived: #{item.archived}"

    end
  when 2
    puts "List of Sources:"
    sources = items.map(&:source).uniq.compact
    sources.each do |source|
      puts "- Name: #{source}"
    end
  when 3
    puts "Enter movie title:"
    title = gets.chomp
    puts "Enter publish date (YYYY-MM-DD):"
    publish_date = gets.chomp
    puts "Is it silent? (y/n)"
    if gets.chomp.downcase == 'y'
        silent = true
    end

    movie = Movie.new(title, publish_date, silent: silent)
    movie.move_to_archive
    items << movie

    puts "Movie added!"

  when 4
    puts "Enter source name:"
    source_name = gets.chomp
  
    source = Source.new(source_name)
    items.each do |item|
      if item.source.nil?
        item.source = source.name
      end
    end
  
    puts "Source added!"
  when 5
    # Save data to JSON files before exiting
    save_data(items)
    break
  else
    puts "Invalid option. Please try again."
  end
end

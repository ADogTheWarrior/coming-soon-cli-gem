class Movie
  @@all = []
  attr_accessor :name, :date, :mp_rating, :time, :description, :themes, :actors, :url

  def initialize(movie_hash)
    @name = movie_hash[:name] || ""
    @date = movie_hash[:date] || ""
    @mp_rating = movie_hash[:mp_rating] || ""
    @time = movie_hash[:time] || ""
    @description = movie_hash[:description] || ""
    @themes = movie_hash[:themes] || []
    @actors = movie_hash[:actors] || []
    @url = movie_hash[:url] || ""
    @@all << self
  end

  def self.create_from_collection(movies_array)
    movies_array.each do |movie|
      Movie.new(movie)
    end
  end

  def self.all
    @@all
  end

  def self.display_movies
    @@all.each.with_index(1) do |movie, position|
      puts "#{position}. #{movie.name} - #{movie.date}"
    end
  end

  # either return the movie or return false
  def self.find_by_position(position)
    index = position.to_i-1
  binding.pry
    if @@all.size > index
      @@all[index]
    else
      false
    end
  end

  # either return the movie or return false
  def self.find_by_name(name)
    @@all.each do |movie|
      if movie.name == name
        return movie
      end
    end
    false
  end
  def display_details
    puts "Title: #{self.name}"
    puts "Release Date: #{self.date}"
    puts "Rating: #{self.mp_rating}"
    puts "Run Time: #{self.time}"
    puts "Themes:"
    puts_array_helper(self.themes)
    puts "Description: #{self.description}"
    puts "Actors:"
    puts_array_helper(self.actors)
  end

  def puts_array_helper(array)
    if array.size != 0
      array.each do |item|
        puts "    #{item}"
      end
    end
  end
end

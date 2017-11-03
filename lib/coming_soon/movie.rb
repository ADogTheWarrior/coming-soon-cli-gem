class Movie
  @@all = []
  attr_accessor :name, :date, :mp_rating, :time, :description, :themes, :actors, :url

  def initialize(movie_hash)
    @name = ""
    @date = ""
    @mp_rating = ""
    @time = ""
    @description = ""
    @themes = []
    @actors = []
    @url = ""
    movie_hash.each {|key, value| self.send(("#{key}="), value)}
    self.save
  end

  def add_movie_attributes(attributes_hash)
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.create_from_collection(movies_array)
    movies_array.each do |movie|
      Movie.new(movie)
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.display_movies
    self.all.each.with_index(1) do |movie, position|
      puts "#{position}. #{movie.name} - #{movie.date}"
    end
  end

  # either return the movie or return false
  def self.find_by_position(position)
    index = position.to_i-1

    if self.all.size > index
      self.all[index]
    else
      false
    end
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

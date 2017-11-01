class Movie
  @@all = []
  attr_accessor :name, :date, :mp_rating, :time, :description, :themes, :actors, :url

  def initialize(name, date)
    @name = name
    @date = date
    self.save
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
    # puts "Rating: #{self.mp_rating}"
    # puts "Run Time: #{self.time}"
    # # puts "Themes: #{self.themes}" TODO
    # puts "Description: #{self.description}"
    # # puts "Actors: #{self.actors}" TODO
  end
end

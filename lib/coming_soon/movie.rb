class Movie
  @@all = []
  attr_accessor :name, :date, :mp_rating, :time, :description, :themes, :actors, :url

  def initialize
    self.save
  end

  def save
    @@all << self
  end

  def all
    @@all
  end

  def self.list_opening_month
    self.all.each do |movie|

    end
    # display list
    puts "1. THOR RAGNAROK - NOV 3"
    puts "2. A BAD MOM'S CHRISTMAS - NOV 3"
    puts "3. DADDY'S HOME 2 - NOV 10"
    puts "4. MURDER EXPRESS - NOV 10"
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

  def display_general
  end

  def display_details
    puts "Title: #{self.name}"
    puts "Release Date: #{self.date}"
    puts "Rating: #{self.mp_rating}"
    puts "Run Time: #{self.time}"
    # puts "Themes: #{self.themes}"
    puts "Description: #{self.description}"
    # puts "Actors: #{self.actors}"
  end
end

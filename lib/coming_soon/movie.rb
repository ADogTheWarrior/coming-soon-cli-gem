class Movie
  @@all = []
  attr_accessor :name, :date, :mp_rating, :time,
    :url, :description, :themes, :budget, :actors

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

  def display_details
    puts "#{self.name}"
  end
end

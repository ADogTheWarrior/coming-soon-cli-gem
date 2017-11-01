class Movie
  @@all = []

  def initialize
    @@all << self
  end

  def self.list_opening_month
    puts "1. THOR RAGNAROK - NOV 3"
    puts "2. A BAD MOM'S CHRISTMAS - NOV 3"
    puts "3. DADDY'S HOME 2 - NOV 10"
    puts "4. MURDER EXPRESS - NOV 10"
  end

  # either return the movie or return false
  def self.find_by_position(position)
    # index = position.to_i-1

    case position
    when "1"
      puts "THOR RAGNAROK - NOV 3"
      puts "thor description"
    when "2"
      puts "A BAD MOM'S CHRISTMAS - NOV 3"
      puts "mom's description"
    else
      # puts ""
    end
  end
end

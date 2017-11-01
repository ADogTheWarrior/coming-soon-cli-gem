class ComingSoon::Movie
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

  # either return the position or return false
  def self.find_by_position(position)
    case position
    when "1"
      puts "1. THOR RAGNAROK - NOV 3"
      puts "thor description"
    when "2"
      puts "2. A BAD MOM'S CHRISTMAS - NOV 3"
      puts "mom's description"
    else

    #serach @@all
  end
end

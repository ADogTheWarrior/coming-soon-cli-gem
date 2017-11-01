class Scraper
  def self.this_week
    Movie.new("Thor", "nov 3")
  end

  def self.this_month
    Movie.new("It", "nov 24")
  end
end

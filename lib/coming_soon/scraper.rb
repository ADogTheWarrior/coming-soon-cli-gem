class Scraper
  def self.this_week
    Movie.new(name: "Thor",
    date: "nov 3",
    mp_rating: "PG-13",
    time: "140 mins",
    description: "Lorem Ipsum ...",
    themes: ["Comedy", "Action"],
    actors: ["Matt Damon", "Chris Hemsworth"])
  end

  def self.this_month
    Movie.new(name: "It",
    date: "nov 24",
    mp_rating: "R",
    time: "130 mins",
    description: "Lorem Ipsum",
    themes: ["Horror", "Action"],
    actors: ["Matt Damon", "Brad Pitt"])
  end

  def self.get_details(url)
  end
end

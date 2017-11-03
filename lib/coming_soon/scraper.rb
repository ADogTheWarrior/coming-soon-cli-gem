class Scraper
  def self.this_week
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/"))
    return_array_of_hash = []
    #even after .strip has one trailing whitespace but its ascii like \u{a0}
    date = doc.css(".sub-list").css(".list").css("h3").children.first.text.split("- ")[1]
    movies = doc.css(".overview-top")
    movies.each do |movie|
      new_movie_hash = {}
      # title = movie.css("h4").css("a")
      # url = movie.css("h4").css("a").first.attributes.first[-1]
      return_array_of_hash << new_movie_hash
        binding.pry
    end
    return_array_of_hash
  end

  def self.this_month
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))

    Movie.new(name: "It",
    date: "nov 24",
    mp_rating: "R",
    time: "130 mins",
    description: "Lorem Ipsum",
    themes: ["Horror", "Action"],
    actors: ["Matt Damon", "Brad Pitt"])

    Movie.new(name: "Thor",
    date: "nov 3",
    mp_rating: "PG-13",
    time: "140 mins",
    description: "Lorem Ipsum ...",
    themes: ["Comedy", "Action"],
    actors: ["Matt Damon", "Chris Hemsworth"])
  end

  def self.get_details(movie_url)
    doc = Nokogiri::HTML(open(movie_url))
  end
end

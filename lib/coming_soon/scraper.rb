class Scraper
  def self.this_week
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-in-theaters/"))
    return_array_of_hash = []
    date = doc.css(".sub-list").css(".list").css("h3").children.first.text.split("- ")[1]
    #even after .strip date has one trailing whitespace but its ascii like \u{a0}
    movies = doc.css(".overview-top")
    movies.each do |movie|
      new_movie_hash = {}
      new_movie_hash[:date] = date
      new_movie_hash[:name] = movie.css("h4").css("a").first.attribute("title").text
      new_movie_hash[:url] = "http://www.imdb.com" + movie.css("h4").css("a").first.attribute("href").text
      if movie.css("p").children[1].attribute("title") != nil
        new_movie_hash[:mp_rating] = movie.css("p").children[1].attribute("title").value
      else
        new_movie_hash[:mp_rating] = "Not Rated"
      end
      new_movie_hash[:description] = movie.css(".outline").text.strip
      new_movie_hash[:time] = movie.css("p").children[3].children.text
      return_array_of_hash << new_movie_hash
    end
    return_array_of_hash
  end

  def self.this_month
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    return_array_of_hash = []
    movies = doc.css(".overview-top")
    movies.each do |movie|
# binding.pry
      new_movie_hash = {}
      new_movie_hash[:name] = movie.css("h4").css("a").first.attribute("title").text
      new_movie_hash[:url] = "http://www.imdb.com" + movie.css("h4").css("a").first.attribute("href").text
      if movie.css("p").children[1].attribute("title") != nil
        new_movie_hash[:mp_rating] = movie.css("p").children[1].attribute("title").value
      else
        new_movie_hash[:mp_rating] = "Not Rated"
      end
      new_movie_hash[:description] = movie.css(".outline").text.strip
      new_movie_hash[:time] = movie.css("p").children[3].children.text
      return_array_of_hash << new_movie_hash
    end
    return_array_of_hash
  end

  def self.get_details(movie_url)
    # needs date, genres, actors
    # if no rating then the time is off
    doc = Nokogiri::HTML(open(movie_url))
  end
end

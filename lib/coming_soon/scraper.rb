class Scraper
  def self.this_month
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    return_array_of_hash = []
    movies = doc.css(".overview-top")
    movies.each do |movie|
      new_movie_hash = {}
      new_movie_hash[:name] = movie.css("h4").css("a").first.attribute("title").text.split("(")[0].strip
      new_movie_hash[:url] = "http://www.imdb.com" + movie.css("h4").css("a").first.attribute("href").text
      if movie.css("p").children[1].attribute("title") != nil
        new_movie_hash[:mp_rating] = movie.css("p").children[1].attribute("title").value
      else
        new_movie_hash[:mp_rating] = "Not Rated"
      end
      new_movie_hash[:description] = movie.css(".outline").text.strip
      return_array_of_hash << new_movie_hash
    end
    return_array_of_hash
  end

  def self.get_dates
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    date = ""
    month = doc.css("h4").first.children.children.text.split(" ")[0]
    movies_dates = doc.css("h4")
    movies_dates.each do |item|
      item_text = item.children.children.text.split("(")[0].strip
      if item_text.include? month
        date = item_text
      else
        movie = Movie.find_by_name(item_text)
        if movie
          movie.date = date
        end
      end
    end
  end

  def self.get_details(movie)
    puts "Scraping..."
    doc = Nokogiri::HTML(open(movie.url))
    #the if statement below is to fix a bug i have because of the way i scrap the rating.
    #when a movie doesn't have a rating it shifts the position of where i can find the time duration of a movie
    if movie.mp_rating != "Not Rated"
      movie.time = doc.css(".subtext").children[5].children.text.strip
    else
      movie.time = doc.css(".subtext").children[1].children.text.strip
    end
    # this line of code below grabs dates that can be different than the dates on the index page
    # movie.date = doc.css(".subtext").children[-2].children.text.split("(")[0].strip
    themes = doc.css(".subtext").css("a")
    themes.each do |theme|
      if theme.children.children.text != ""
        movie.themes << theme.children.children.text
      end
    end
    actors = doc.css(".credit_summary_item")[-1].css("a")
    actors.each do |actor|
      if actor.children.children.text != ""
        movie.actors << actor.children.children.text
      end
    end
  end
end

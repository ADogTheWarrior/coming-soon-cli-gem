class CLI

  def call
    intro
    opening_month
    menu
  end

  def intro
    puts "Welcome to Coming Soon, the gem!"
    # Movie.create_from_collection(Scraper.this_week)
    Movie.create_from_collection(Scraper.this_month)
    Movie.all.each do |movie|
      movie.add_movie_attributes(Scraper.get_details(movie.url))
    end
  end

  def opening_month
    puts "Opening this month:"
    Movie.display_movies
  end

  def menu
    input = nil
    while (input != "exit")
      puts "Enter the movie number to get a description or enter list to display the list of movies, or exit"
      input = gets.strip

      if input.to_i > 0
        movie = Movie.find_by_position(input)
        if movie != false
          movie.display_details
        else
          puts "Please try a different input"
        end
      elsif input == "list"
        opening_month
      elsif input == "exit"
        puts "Thank you for using Coming Soon, the gem!"
      else
        puts "Please try a different input"
      end
    end
  end
end

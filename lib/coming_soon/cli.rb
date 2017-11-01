class CLI

  def call
    intro
    opening_month
    menu
  end

  def intro
    puts "Welcome to Coming Soon, the gem!"
    # initialize movies!
  end

  def opening_month
    puts "Opening this month:"
    Movie.list_opening_month
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
          puts "Please try different input"
        end
      elsif input == "list"
        opening_month
      elsif input == "exit"
        puts "Thank you for using Coming Soon, the gem!"
      else
        puts "Please try different input"
      end
    end
  end
end




# would you like details of a particular move, which one =>
# display list =>
# option to keep asking until quit

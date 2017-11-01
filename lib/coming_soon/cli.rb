class CLI

  def call
    intro
    opening_month
    menu
  end

  def intro
    puts "Welcome to Coming Soon, the gem!"
  end

  def opening_month
    puts "Opening this month:"
    Movie.list_opening_month
  end

  def menu
    input = nil
    while (input != "exit")
      puts "Enter the movie number to get a description or list to display the list of movies, or exit"
      input = gets.strip

      movie = Movie.find_by_position(input)
      if movie != false
        # movie.display_details
      end

    end

    puts "Thank you for using Coming Soon, the gem!"
  end
end




# would you like details of a particular move, which one =>
# display list =>
# option to keep asking until quit

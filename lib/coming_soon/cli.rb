class ComingSoon::CLI

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
    ComingSoon::Movie.list_opening_month
  end

  def menu
    input = nil
    while (input != "exit")
      puts "Which movie would you like to know more about? (Enter movie number)"
      input = gets.strip

      Movie.find_by_position(input)

    end

    puts "Thank you for using Coming Soon, the gem!"
  end
end




# would you like details of a particular move, which one =>
# display list =>
# option to keep asking until quit

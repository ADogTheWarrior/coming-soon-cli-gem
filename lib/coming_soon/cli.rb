class ComingSoon::CLI

  def call
    intro
    opening_week
    opening_month
    menu
  end

  def intro
    puts "Welcome to Coming Soon, the gem!"
  end

  def opening_week
    puts "Opening this week:"
    ComingSoon::Movie.list_opening_week
  end

  def opening_month
    puts "Opening this month:"
    ComingSoon::Movie.list_opening_month
  end

  def menu

  end
end




# would you like details of a particular move, which one =>
# display list =>
# option to keep asking until quit

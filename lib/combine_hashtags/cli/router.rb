# frozen_string_literal: tru

# Router for CLI
class CombineHashtags::Router
  def initialize(controller)
    @controller = controller
    @running    = true
  end

  def run
    puts "Welcome!"
    puts "---"

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def route_action(action) 
    case action
    when 1 then @controller.setup
    when 2 then @controller.list 
    when 3 then @controller.search
    
    when 0 then stop
    else
      puts "Please select an option"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Fetch data for a new profile"
    puts "2 - See profile's most popular hashtags"
    puts "3 - Start a search"
    puts "   ---"
    puts "0 - Stop and exit the program"
  end
end
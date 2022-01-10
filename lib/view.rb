require_relative 'profile'

class View
  def initialize
    @tags = {}
    @title_list = 'These are your 10 most popular hashtags:'
    @title_search = 'Showing X results:'
  end

  def display_title(string)
    puts '  --------------------------------------------'
    puts "    #{string}"
    puts '  --------------------------------------------'
  end

  def display_tags(content)
    content.each_with_index do |value, index|
      puts "  #{index + 1} => #{value[0]} appears #{value[1]} times in this profile"
      puts ''
    end
  end

  def display_links(results)
    puts '*********************************************'
    results.each_with_index do |value, index|
      preview = value.caption.gsub("\n", '').scan(/^[a-zA-Z\s\S][^#@]*/)
      puts ''
      puts "  #{index + 1} - Post preview:"
      puts "  #{preview.first}"
      puts "  Go to: #{value.post_url}"
      puts ' '
      puts '* * * * * * * * * * * * * * * * * * * * * *'
    end
    puts '*********************************************'
  end

  def search
    puts 'Type the 1st hashtag you would like to search with'
    puts '>'
    @tags[:first] = gets.chomp
    puts 'Type the 2nd hashtag you would like to search with'
    puts '>'
    @tags[:second] = gets.chomp
    @tags
  end
 end

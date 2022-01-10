require_relative 'profile'

class View
  def initialize
    @tags = {}
  end

  def display_tags(content)
    content.each_with_index do |value, index|
      puts "#{index + 1} => #{value[0]} appears #{value[1]} times in this profile"
      puts ''
    end
  end

  def display_links(results)
    results.each_with_index do |value, index|
      preview = value.caption.gsub("\n", '').scan(/^[a-zA-Z\s\S][^#@]*/)
      puts "Post preview: #{preview}"
      puts "Go to: #{value.post_url}"
    end
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

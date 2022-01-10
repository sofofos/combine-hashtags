require_relative 'profile'

# View class for CLI display
class View
  def initialize
    @tags = {}
    @list = 'These are your 10 most popular hashtags:'
    @search = 'Showing X results:'
  end

  def title(type)
    title = type == 'list' ? @list : @search
    puts '  --------------------------------------------'
    puts "    #{title}"
    puts '  --------------------------------------------'
  end

  def tags(content)
    title('list')
    content.each_with_index do |value, index|
      puts "  #{index + 1} - #{value[0]} appears #{value[1]} times in this profile"
      puts ''
    end
  end

  def results(results)
    @search.gsub!('X', results.size.to_s)
    title('search')
    puts ''
    links(results)
    puts ''
  end

  def links(results)
    results.each_with_index do |value, index|
      preview = value.caption.gsub("\n", '').scan(/^[a-zA-Z\s\S][^#@]*/)
      puts ''
      puts "  #{index + 1} - Post preview:"
      puts "  #{preview.first}"
      puts "  Go to => #{value.post_url}"
      puts ' '
      puts '* * * * * * * * * * * * * * * * * * * * * *'
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

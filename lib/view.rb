require_relative 'profile'

class View
  def initialize
    @first_tag = ""
    @second_tag = ""
  end

  def display(content)
    content.each_with_index do |value, index|
      puts "#{index + 1} => #{value[0]} appears #{value[1]} times in this profile"
      puts " "
    end
  end
end
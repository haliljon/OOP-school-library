require_relative 'main/display_menu'
require_relative 'main/choose_option'

class Main
  def start
    puts 'Welcome to School Library App!'
    puts
    display = DisplayMenu.new
    choose_option = ChooseOption.new
    loop do
      display.print_menu
      option = gets.chomp.to_i
      choose_option.choose_option(option)
    end
  end
end

main = Main.new
main.start

require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def start
    puts 'Welcome to School Library App!'
    puts
    loop do
      print_menu
      option = gets.chomp.to_i
      if option == 7
        puts 'Thank you for using this app!'
        break
      end
      choose_option(option)
    end
  end

  def print_menu
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print 'Enter your choice: '
  end

  def choose_option(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_all_rentals_for_person_id
    else
      puts 'That is not a valid option'
    end
  end
end

main = Main.new
main.start

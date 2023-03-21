require_relative '../app'

class ChooseOption
  def initialize
    @app = App.new
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
    when 7
      puts 'Thank you for using this app!'
      exit
    else
      puts 'That is not a valid option'
    end
  end
end

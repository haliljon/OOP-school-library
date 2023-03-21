require_relative 'app/list_rentals'
require_relative 'app/list_books'
require_relative 'app/list_people'

class App
  def initialize
    @list_people = ListPeople.new
    @list_books = ListBooks.new
    @list_rentals = ListRentals.new
  end

  def list_all_books
    @list_books.list_books
  end

  def list_all_people
    @list_people.list_all_people
  end

  def create_person
    @list_people.create_person
  end

  def create_book
    @list_books.create_book
  end

  def create_rental
    @list_rentals.create_rental(@list_books.books, @list_people.people)
  end

  def list_all_rentals_for_person_id
    @list_rentals.list_all_rentals_for_person_id
  end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end

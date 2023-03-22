require_relative '../rental'
require_relative '../data'

class ListRentals
  attr_accessor :rentals

  def initialize
    @data = Data.new
    @rentals = @data.load_rentals
  end

  def create_rental(books, people)
    puts 'Select a book from the following list by number'
    books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts 'Date:'
    date = gets.chomp.to_s
    rental = Rental.new(date, people[person_index], books[book_index])
    @rentals << rental
    @data.create_rental(rental)
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    puts 'Rentals:'
    rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'No rentals found for that ID'
      end
    end
  end
end

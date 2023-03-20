require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require_relative 'classroom'

class App
  attr_accessor :books, :people, :rentals, :classroom

  def initialize
    @books = []
    @people = []
    @rentals = []
    @classroom = ['Web Development']
  end

  # def list_all_books(@books)
  #   @books.each do |book|
  #     puts "Title: #{book.title}, Author: #{book.author}"
  #   end
  # end
  list_books=ListBooks.new
  list_books.list_all_books(@books)

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp.to_i

    case input
    when 1
      create_student
    when 2
      create_teacher
    else
      invalid_input
      create_person
    end
  end

  def create_student
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Has parent permission? [Y/N]:'
    has_permission = gets.chomp.to_s.upcase
    case has_permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      invalid_input
      create_student
    end

    @people << Student.new(classroom, age, name, parent_permission: permission)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Specialization:'
    specialization = gets.chomp.to_s

    @people << Teacher.new(specialization, name, age)
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp.to_s
    puts 'Author:'
    author = gets.chomp.to_s
    books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def create_rental
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
    rentals << Rental.new(date, people[person_index], books[book_index])
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

  def invalid_input
    puts 'Invalid entry, try again'
  end
end

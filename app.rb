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

  def get_user_input_int(message)
    puts message
    gets.chomp.to_i
  end

  def get_user_input_string(message)
    puts message
    gets.chomp.to_s
  end

  def list_all_books
    puts 'Please add a book to the library' if @books.empty?
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people
    puts 'Please add a person to the library' if @people.empty?
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    input = get_user_input_int('Do you want to create a student (1) or a teacher (2)? [Input the number]:')

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
    age = get_user_input_int('Age:')
    name = get_user_input_string('Name:')
    has_permission = get_user_input_string('Has parent permission? [Y/N]:').upcase
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
    age = get_user_input_int('Age:')
    name = get_user_input_string('Name:')
    specialization = get_user_input_string('Specialization:')

    @people << Teacher.new(specialization, age, name)
    puts 'Person created successfully'
  end

  def create_book
    title = get_user_input_string('Title:')
    author = get_user_input_string('Author:')
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
    date = get_user_input_string('Date:')
    rentals << Rental.new(date, people[person_index], books[book_index])
    puts 'Rental created successfully'
  end

  def list_all_rentals_for_person_id
    id = get_user_input_int('ID of person:')
    puts 'Rentals:'
    rentals.each do |rental|
      if rental.person.id == id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      else
        puts 'There are no rentals for that ID'
      end
    end
  end

  def invalid_input
    puts 'Invalid entry, try again'
  end
end

require 'json'
require_relative 'book'
require_relative 'person'
require_relative 'rental'

PATH = './data/'.freeze
class Data
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def load_books
    return [] unless File.size?("#{PATH}book.json")

    stored_books = JSON.parse(File.read("#{PATH}book.json"))
    stored_books.map do |book|
      @books << Book.new(book['id'], book['title'], book['author'])
    end
    @books
  end

  def create_book(book)
    if File.size?("#{PATH}book.json")
      stored_books = JSON.parse(File.read("#{PATH}book.json"))
      stored_books << { id: book.id, title: book.title, author: book.author }
      File.write("#{PATH}book.json", JSON.pretty_generate(stored_books))
    else
      File.write("#{PATH}book.json", JSON.pretty_generate([{ id: book.id, title: book.title, author: book.author }]))
    end
  end

  def load_people
    return [] unless File.size?("#{PATH}person.json")

    stored_people = JSON.parse(File.read("#{PATH}person.json"))
    stored_people.map do |person|
      case person['type']
      when 'student'
        @people << Student.new(person['id'], nil, person['age'], person['parent_permission'])
      when 'teacher'
        @people << Teacher.new(nil, person['specialization'], person['age'], person['name'])
      end
    end
    @people
  end

  def create_person(person)
    if File.size?("#{PATH}person.json")
      stored_people = JSON.parse(File.read("#{PATH}person.json"))
      stored_people << if person.instance_of? Student
                         { id: person.id, age: person.age, name: person.name,
                           parent_permission: person.parent_permission, type: 'student' }
                       else
                         { id: person.id, age: person.age, name: person.name,
                           specialization: person.specialization, type: 'teacher' }
                       end
      File.write("#{PATH}person.json", JSON.pretty_generate(stored_people))
    else
      user_file = if person.instance_of? Student
                    { id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission,
                      type: 'student' }
                  else
                    { id: person.id, age: person.age, name: person.name, specialization: person.specialization,
                      type: 'teacher' }
                  end
      File.write("#{PATH}person.json", JSON.pretty_generate([user_file]))
    end

    def load_rentals
      return [] unless File.size?("#{PATH}rental.json")

      stored_rentals = JSON.parse(File.read("#{PATH}rental.json"))
      stored_rentals.map do |rental|
        p rental['book']
        p rental['person']
        book = @books.find { |x| x.id == rental['book'] }
        person = @person.find { |x| x.id == rental['person'] }
        @rentals << Rental.new(rental['date'], book, person)
      end
      @rentals
    end
  end

  def create_rental(rental)
    if File.size?("#{PATH}rental.json")
      stored_rentals = JSON.parse(File.read("#{PATH}rental.json"))
      stored_rentals << { date: rental.date, book: rental.book.id, person: rental.person.id }
      File.write("#{PATH}rental.json", JSON.pretty_generate(stored_rentals))
    else
      File.write("#{PATH}rental.json",
                 JSON.pretty_generate([{ date: rental.date, book: rental.book.id, person: rental.person.id }]))
    end
  end
end

require 'json'
require_relative '../book'
require_relative '../person'
require_relative '../rental'

class Data
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def load_books
    return [] unless File.size?('../data/book.json')

    stored_books = JSON.parse(File.read('../data/book.json'))
    stored_books.map do |book|
      @books << Book.new(book.id, book.title, book.author)
    end
    @books
  end

  def create_book(book)
    if File.size?('../data/book.json')
      stored_books = JSON.parse(File.read('../data/book.json'))
      stored_books << {id: book.id, title: book.title, author: book.author}
      File.write('..data/book.json', JSON.pretty_generate(stored_books))
    else
      File.write('../data/book.json', JSON.pretty_generate([{ id: book.id, title: book.title, author: book.author }]))
    end
  end

  def load_people
    return [] unless File.size?('../data/person.json')

    stored_people = JSON.parse(File.read('../data/person.json'))
    stored_people.map do |person|
      case person.type
      when 'student'
        @people << Student.new(person.id, nil, person.age, person.parent_permission)
      when 'teacher'
        @people << Teacher.new(nil, person.specialization, person.age, person.name)
      end
    end
    @people
  end
end

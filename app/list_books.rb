require_relative '../book'
require_relative '../data'

class ListBooks
  attr_accessor :books

  def initialize
    @data = Data.new
    @books = @data.load_books
  end

  def list_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_book
    puts 'Title:'
    title = gets.chomp.to_s
    puts 'Author:'
    author = gets.chomp.to_s
    book = Book.new(nil, title, author)
    @books << book
    @data.create_book(book)
    puts 'Book created successfully'
  end
end

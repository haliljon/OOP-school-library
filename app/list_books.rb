require_relative '../book'

class ListBooks
  attr_accessor :books

  def initialize
    @books = []
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
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end
end

require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :rentals, :id

  def initialize(_id, title, author)
    @id = Random.rand(1...1000)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    @rentals << Rental.new(date, person, self)
  end
end

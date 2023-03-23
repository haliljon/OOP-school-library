require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id || Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission == true
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    @rentals << Rental.new(date, self, book)
  end

  # def add_rental(rental)
  #   @rentals.push(rental)
  #   rental.person = self
  # end
end

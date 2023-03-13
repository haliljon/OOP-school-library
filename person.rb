class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age > 18
  end

  private :of_age?

  def can_use_services?
    is_of_age? || @parent_permission == true
  end

  attr_reader :id
  attr_accessor :name, :age
end

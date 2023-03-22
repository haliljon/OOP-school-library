require './person'

class Student < Person
  attr_accessor :classroom

  # def initialize(id, age, name = 'Unknown', parent_permission: true)
  #   super(id, age, name, parent_permission: parent_permission)
  #   @classroom = classroom
  # end
  def initialize(id, classroom, age, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end

  def add_classroom(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end

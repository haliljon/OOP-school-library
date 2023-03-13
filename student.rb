require './person'

class Student < Person
  def initialize(classroom, age, parent_permission, name = 'Unknown')
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    puts '¯\(ツ)/¯'
  end
end

require_relative '../student'
require_relative '../teacher'
require_relative '../data'

class ListPeople
  attr_accessor :people

  def initialize
    @data = Data.new
    @people = @data.load_people
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    input = gets.chomp.to_i

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
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Has parent permission? [Y/N]:'
    has_permission = gets.chomp.to_s.upcase
    case has_permission
    when 'Y'
      permission = true
    when 'N'
      permission = false
    else
      invalid_input
      create_student
    end

    person = Student.new(nil, nil, age, name, parent_permission: permission)
    @people << person
    @data.create_person(person)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp.to_i
    puts 'Name:'
    name = gets.chomp.to_s
    puts 'Specialization:'
    specialization = gets.chomp.to_s

    person = Teacher.new(nil, age, name, specialization)
    @people << person
    @data.create_person(person)
    puts 'Person created successfully'
  end
end

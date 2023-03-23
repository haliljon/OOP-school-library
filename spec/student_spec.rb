require './student'
require './person'

describe Student do
  student = Student.new(1, 'Classroom 1', 17, 'John')

  describe '#new' do
    it 'returns a new Student object' do
      expect(student).to be_an_instance_of Student
    end
  end

  describe '#play_hooky' do
    it 'returns the correct string' do
      expect(student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      expect(student.name).to eq 'John'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      expect(student.age).to eq 17
    end
  end

  describe '#classroom' do
    it 'returns the correct classroom' do
      expect(student.classroom).to eq 'Classroom 1'
    end
  end
end
